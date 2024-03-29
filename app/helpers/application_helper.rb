module ApplicationHelper

	def flash_class(level)
		case level
		when :notice then "success"
		when :error then "error"
		when :alert then "warning"
		end
	end

	def title(page_title)
		content_for(:title) { page_title + ' | ElusiveInvite.com' }
	end

end