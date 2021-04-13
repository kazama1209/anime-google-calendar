require "./google_calendar.rb"
require "./programs.rb"

# 日時をISO 8601規格に整形する
def format_time(time)
  ymd = time.to_s.split(" ")[0]
  hms = time.to_s.split(" ")[1]
  
  "#{ymd}T#{hms}+09:00"
end

def lambda_handler(event:, context:)
  # 番組を取得してGoogleカレンダーに書き込む
  programs = get_programs(1)
  google_calender = GoogleCalendar.new

  programs.each do |program|
    google_calender.insert_event(
      program[:title],
      program[:sub_title],
      program[:ch_name],
      format_time(program[:st_time]),
      format_time(program[:ed_time])
    )
  end
end
