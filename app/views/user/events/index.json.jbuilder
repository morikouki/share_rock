#{カレンダーに表示する内容}
json.array!(@events) do |event|
  json.extract! event, :title
  json.start event.start_date
  json.end event.end_date
  json.url user_event_url(event, format: :html)
end
