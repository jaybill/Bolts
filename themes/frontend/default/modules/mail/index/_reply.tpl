

On {$reply_to_message.sent_date|date_format:$format_datetime_small}, {$from_user.full_name} ({$from_user.username}) wrote:
>{$reply_to_message.message|replace:"\n":">"|wordwrap:50:"\n>"}
