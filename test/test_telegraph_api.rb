require_relative 'test_helper'

class TestTelegraphApi < Minitest::Test
  def test_create_user
    result = create_account

    refute_nil result.access_token, 'Access Token is nil'
  end

  def test_create_page
    result = create_account

    html = '<b>Test Content<u>sadasd</u></b><img src="123" />'
    content = TelegraphApi::DomToNode.call(html)

    data = {
      access_token: result.access_token,
      title: 'Test Title',
      content: JSON.dump(content),
      return_content: true
    }

    result = TelegraphApi::Client.create_page(data)

    refute_nil result.content, 'Content is nil'
    refute_nil result.url, 'Url is nil'
  end

  private

  def create_account
    data = { short_name: 'test' }
    TelegraphApi::Client.create_account(data)
  end
end
