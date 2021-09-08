import React from 'react'
import { create } from 'react-test-renderer'
import MapSearch from '../map-search'
import searchData from '../../__test__/search-mockArray'

describe('Map-Search Component', () => {
  it('should match snapshot with given search data', () => {
    const tree = create(
      <MapSearch
        users={searchData.users.slice(1)}
        usergroups={searchData.usergroups}
        hashtags={[]}
        clicked={jest.fn()}
      />
    ).toJSON()
    expect(tree).toMatchSnapshot()
  })
})
