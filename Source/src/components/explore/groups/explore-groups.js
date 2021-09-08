import React, { Component } from 'react'
import { FadeIn } from 'animate-components'
import Title from '../../others/title'
import { connect } from 'react-redux'
import { getGroupsToExplore } from '../../../actions/explore'
import Nothing from '../../others/nothing'
import ExploreGroupsList from './explore-usergroups-list'
import IsLoading from '../../others/isLoading'
import { cLoading } from '../../../utils/utils'
import classNames from 'classnames'

class ExploreGroups extends Component {
  state = {
    loading: true,
  }

  componentDidMount = () => this.props.dispatch(getGroupsToExplore())

  componentWillReceiveProps = () => this.setState({ loading: false })

  render() {
    let { usergroups } = this.props,
      { loading } = this.state,
      len = usergroups.length,
      map_usergroups = usergroups.map(g => (
        <ExploreGroupsList key={g.group_id} {...g} />
      ))

    return (
      <div>
        <Title value="Explore usergroups" />

        <FadeIn duration="300ms">
          <IsLoading loading={loading} />

          <div
            className={classNames('m_div', cLoading(loading))}
            style={{ marginTop: 0 }}
          >
            <div className="m_wrapper" style={{ width: len == 0 ? 500 : null }}>
              {len == 0 ? (
                <div style={{ width: '100%' }}>
                  <Nothing mssg="Sorry, no usergroups to explore!!" />
                </div>
              ) : (
                map_usergroups
              )}
            </div>
          </div>
        </FadeIn>
      </div>
    )
  }
}

const mapStateToProps = store => ({
  usergroups: store.Explore.usergroups,
})

export default connect(mapStateToProps)(ExploreGroups)
export { ExploreGroups as PureExploreGroups }
