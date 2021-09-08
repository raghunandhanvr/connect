import React, { Component } from 'react'
import { FadeIn } from 'animate-components'
import Title from '../others/title'
import { getUnreadNotifications } from '../../actions/notification'
import { connect } from 'react-redux'
import { getFeed } from '../../actions/post'
import Suggested from '../others/suggested/suggested'
import CreateGroup from '../group/create-group/create-group'
import PostItTeaser from '../post/post-it/post-it-teaser'
import { getUnreadMessages } from '../../actions/message'
import PopularHashtags from '../hashtag/popular-hashtags'
import { Connect } from 'react-content-loader'
import Feed from './feed'

class Home extends Component {
  state = {
    loading: true,
  }

  componentDidMount = () => {
    let { dispatch } = this.props
    dispatch(getFeed())
    dispatch(getUnreadNotifications())
    dispatch(getUnreadMessages())
  }

  componentWillReceiveProps = () => this.setState({ loading: false })

  render() {
    let { loading } = this.state

    return (
      <div>
        <Title value="Home" />

        <FadeIn duration="300ms">
          <div className="raghu home_raghu">
            <div className="ptushar">
              <PostItTeaser type="user" disabled={loading} />

              {loading && (
                <div style={{ marginTop: 20 }}>
                  <Connect />
                  <Connect />
                  <Connect />
                </div>
              )}

              <Feed />
            </div>

            <div className="stushar">
              <Suggested when="home" />
              <PopularHashtags />
              {!loading && <CreateGroup />}
            </div>
          </div>
        </FadeIn>
      </div>
    )
  }
}

const mapStateToProps = store => ({
  store,
})

export default connect(mapStateToProps)(Home)
export { Home as PureHome }
