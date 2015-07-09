module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def comment_url_helper(comment)
    post = comment.post
    topic = post.topic
    [topic, post, comment]
  end

  def profile_comment_url_helper(comment) # comment partial
    post = comment.post
    topic = post.topic
    [topic, post]
  end

  def us_states
      [
        ['Alabama', 'Alabama'],
        ['Alaska', 'Alaska'],
        ['Arizona', 'Arizona'],
        ['Arkansas', 'Arkansas'],
        ['California', 'California'],
        ['Colorado', 'Colorado'],
        ['Connecticut', 'Connecticut'],
        ['Delaware', 'Delaware'],
        ['District of Columbia', 'DC'],
        ['Florida', 'Florida'],
        ['Georgia', 'Georgia'],
        ['Hawaii', 'Hawaii'],
        ['Idaho', 'Idaho'],
        ['Illinois', 'Illinois'],
        ['Indiana', 'Indiana'],
        ['Iowa', 'Iowa'],
        ['Kansas', 'Kansas'],
        ['Kentucky', 'Kentucky'],
        ['Louisiana', 'Louisiana'],
        ['Maine', 'Maine'],
        ['Maryland', 'Maryland'],
        ['Massachusetts', 'Massachusetts'],
        ['Michigan', 'Michigan'],
        ['Minnesota', 'Minnesota'],
        ['Mississippi', 'Mississippi'],
        ['Missouri', 'Missouri'],
        ['Montana', 'Montana'],
        ['Nebraska', 'Nebraska'],
        ['Nevada', 'Nevada'],
        ['New Hampshire', 'New Hampshire'],
        ['New Jersey', 'New Jersey'],
        ['New Mexico', 'New Mexico'],
        ['New York', 'New York'],
        ['North Carolina', 'North Carolina'],
        ['North Dakota', 'North Dakota'],
        ['Ohio', 'Ohio'],
        ['Oklahoma', 'Oklahoma'],
        ['Oregon', 'Oregon'],
        ['Pennsylvania', 'Pennsylvania'],
        ['Puerto Rico', 'Puerto Rico'],
        ['Rhode Island', 'Rhode Island'],
        ['South Carolina', 'South Carolina'],
        ['South Dakota', 'South Dakota'],
        ['Tennessee', 'Tennessee'],
        ['Texas', 'Texas'],
        ['Utah', 'Utah'],
        ['Vermont', 'Vermont'],
        ['Virginia', 'Virginia'],
        ['Washington', 'Washington'],
        ['West Virginia', 'West Virginia'],
        ['Wisconsin', 'Wisconsin'],
        ['Wyoming', 'Wyoming']
      ]
  end

  def us_towns
    [
        ['Cleveland', 'Clevaland'],
        ['Greenville', 'Greenville'],
        ['Indianola', 'Indianola'],
        ['Leland', 'Leland'],
        ['Shaw', 'Shaw']
      ]
  end

  def us_neighborhoods
    [
        ['Newtown', 'Newtown'],
        ['Blackdog', 'Blackdog'],
        ['The Projects', 'The Projects'],
        ['Fair Field', 'Fairfield'],
        ['School Park', 'School Park']
      ]
  end

end
