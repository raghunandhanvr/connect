import React from 'react'
import { create } from 'react-test-renderer'
import SocialInputs from '../social-inputs'

describe('Social-Inputs Component', () => {
  const props = {
    inputs: {
      instagram: 'https://www.instagram.com/raghuvr_',
      github: 'https://github.com/raghunandhanvr/',
      twitter: 'https://twitter.com/raghuvr_',
      facebook: 'https://www.facebook.com/raghunandhanvr',
      website: '',
      phone: '',
    },
    change: jest.fn(),
  }

  it('should match snapshot', () => {
    const tree = create(<SocialInputs {...props} />).toJSON()
    expect(tree).toMatchSnapshot()
  })
})
