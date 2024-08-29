require 'reverse_markdown'

module ReverseMarkdown
  module Converters
    class Hr
      def convert(node, state = {})
        "\n\_\_\_\n"
      end
    end

    class A
      def convert(node, state = {})
        name  = treat_children(node, state)
        href  = node['href']
        title = extract_title(node)

        return name if href.to_s.empty? || name.empty?

        # Sometimes raw links are clickable, to keep this behavior,
        # we must share only the link or discord's scam avoidance
        # feature will show the [name](link) in its ugly, raw form.
        if name.match? /^https:|^http:/
          name
        else
          link = "[#{name}](#{href}#{title})"
          link.prepend(' ') if prepend_space?(node)
          link
        end
      end
    end

    # ReverseMarkdown has a "`register_ns': no implicit conversion of true into String (TypeError)"
    # when github_flavored: true is used. So the following is a hack.
    # Lucky for us that we only care about Ruby
    class Pre < Base
      def convert(node, state = {})
        content = treat_children(node, state)
        "```ruby\n" << content.strip << "\n```"
      end
    end
  end
end
