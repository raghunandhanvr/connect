import React, { Component } from 'react'
import { FadeIn } from 'animate-components'
import Title from '../../../others/title'
import SearchFollowings from '../../../others/search-followings/search-followings'
import { connect } from 'react-redux'
import { Me, bottomScroll } from '../../../../utils/utils'
import { joinGroup } from '../../../../utils/group-utils'
import GroupInstruction from '../../instruction'

class AddGroupMembers extends Component {
  componentDidMount = () => bottomScroll()

  addMember = user => {
    let { gd, session } = this.props
    joinGroup({
      user,
      added_by: session,
      group: gd.group_id,
      when: 'add_grp_member',
    })
  }

  render() {
    let { gd } = this.props

    return (
      <div>
        <Title value="Add members" />

        <FadeIn duration="300ms">
          <div className="raghu pro_raghu">
            <div className="stushar">
              <GroupInstruction />
            </div>

            <div className="ptushar">
              <div className="a_m">
                <div className="a_m_header">
                  <span>Add members</span>
                </div>

                <div className="a_m_main">
                  <SearchFollowings
                    placeholder="Search to add"
                    when="add_grp_members"
                    disabled={!Me(gd.admin)}
                    done={user => this.addMember(user)}
                  />
                </div>
              </div>
            </div>
          </div>
        </FadeIn>
      </div>
    )
  }
}

const mapStateToProps = store => ({
  gd: store.Group.group_details,
  session: store.User.session.id,
})

export default connect(mapStateToProps)(AddGroupMembers)
export { AddGroupMembers as PureAddGroupMembers }
