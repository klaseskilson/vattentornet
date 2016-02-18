module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  def body_class(the_class)
    content_for(:body_class) { the_class }
  end
  def help(text)
    content_tag :span, icon('question-circle'), 'data-tooltip': text, title: text
  end
end
