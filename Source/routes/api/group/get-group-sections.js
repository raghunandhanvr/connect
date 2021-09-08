const app = require('express').Router(),
  db = require('../../../config/db'),
  Group = require('../../../config/Group'),
  User = require('../../../config/User'),
  Post = require('../../../config/Post')

// GET USER GROUPS [REQ = USER]
app.post('/get-user-usergroups', async (req, res) => {
  let _usergroups = await db.query(
      'SELECT usergroups.group_id, usergroups.name, usergroups.admin, group_members.member, group_members.joined_group FROM group_members, usergroups WHERE group_members.member = ? AND group_members.group_id = usergroups.group_id ORDER BY usergroups.created DESC',
      [req.body.user]
    ),
    usergroups = []

  for (let g of _usergroups) {
    let joined = await Group.joinedGroup(req.session.id, g.group_id)
    usergroups.push({ ...g, joined })
  }

  res.json(usergroups)
})

// GET GROUP POSTS [REQ = GROUP]
app.post('/get-group-posts', async (req, res) => {
  let _posts = await db.query(
      'SELECT posts.post_id, posts.user, users.username, users.firstname, users.surname, posts.description, posts.imgSrc, posts.filter, posts.location, posts.type, posts.group_id, usergroups.name AS group_name, posts.post_time FROM posts, usergroups, users WHERE posts.group_id=? AND posts.user = users.id AND posts.group_id = usergroups.group_id AND posts.type=? ORDER BY posts.post_time DESC',
      [req.body.group, 'group']
    ),
    posts = []

  for (let p of _posts) {
    let {
      tags_count,
      likes_count,
      shares_count,
      comments_count,
    } = await Post.getCounts(p.post_id)

    posts.push({
      ...p,
      tags_count,
      likes_count,
      shares_count,
      comments_count,
    })
  }

  res.json(posts)
})

// GET GROUP PHOTOS [REQ = GROUP]
app.post('/get-group-photos', async (req, res) => {
  let photos = await db.query(
    'SELECT posts.post_id, posts.user, users.username, users.firstname, users.surname, posts.imgSrc AS imgsrc, posts.filter, posts.post_time FROM posts, users WHERE posts.group_id = ? AND posts.user = users.id ORDER BY posts.post_time DESC',
    [req.body.group]
  )

  res.json(photos)
})

// GET GROUP MEMBERS [REQ = GRP_ID]
app.post('/get-group-members', async (req, res) => {
  let { grp_id } = req.body,
    { id } = req.session,
    _members = await db.query(
      'SELECT group_members.grp_member_id, group_members.group_id, group_members.member, users.username, users.firstname, users.surname, group_members.added_by, group_members.joined_group FROM group_members, users WHERE group_members.group_id = ? AND group_members.member = users.id ORDER BY group_members.joined_group DESC',
      [grp_id]
    ),
    members = []

  for (let m of _members) {
    let added_by_username = await User.getWhat('username', m.added_by),
      mutualUsers = await User.mutualUsers(id, m.member)

    members.push({
      ...m,
      added_by_username,
      mutualUsersCount: mutualUsers.length,
    })
  }

  res.json(members)
})

module.exports = app
