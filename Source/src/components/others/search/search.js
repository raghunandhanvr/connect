import React, { Component } from 'react'
import { post } from 'axios'
import MapSearch from './map-search/map-search'
import FAIcon from '../icons/font-awesome-icon'
import TextInput from '../input/text'

export default class Search extends Component {
  state = {
    value: '',
    search: {
      users: [],
      usergroups: [],
      hashtags: [],
    },
  }

  hide = () => {
    this.setState({
      search: {
        users: [],
        usergroups: [],
        hashtags: [],
      },
    })
  }

  search = async ({ target: { value } }) => {
    this.setState({ value })
    if (value.trim() != '') {
      let { data } = await post('/api/search-connect', { value })
      this.setState({ search: data })
    } else {
      this.hide()
    }
  }

  clicked = () => {
    this.setState({ value: '' })
    this.hide()
  }

  render() {
    let {
      value,
      search: { users, usergroups, hashtags },
    } = this.state

    return (
      <div>
        <div className="search_box">
          <TextInput
            placeholder="Search Connect"
            autoFocus
            value={value}
            valueChange={this.search}
            className="search"
          />
          <span className="search_icon">
            <FAIcon icon="search" />
          </span>
        </div>

        {users.length > 0 || usergroups.length > 0 || hashtags.length > 0 ? (
          <MapSearch
            users={users}
            usergroups={usergroups}
            hashtags={hashtags}
            clicked={this.clicked}
          />
        ) : null}
      </div>
    )
  }
}
