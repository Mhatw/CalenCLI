require "date"
require "time"
require "active_support"
require "colorize"
require "colorized_string"

class String
  def black
    "\e[30m#{self}\e[0m"
  end

  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def brown
    "\e[33m#{self}\e[0m"
  end

  def blue
    "\e[34m#{self}\e[0m"
  end

  def magenta
    "\e[35m#{self}\e[0m"
  end

  def cyan
    "\e[36m#{self}\e[0m"
  end

  def gray
    "\e[37m#{self}\e[0m"
  end

  def bg_black
    "\e[40m#{self}\e[0m"
  end

  def bg_red
    "\e[41m#{self}\e[0m"
  end

  def bg_green
    "\e[42m#{self}\e[0m"
  end

  def bg_brown
    "\e[43m#{self}\e[0m"
  end

  def bg_blue
    "\e[44m#{self}\e[0m"
  end

  def bg_magenta
    "\e[45m#{self}\e[0m"
  end

  def bg_cyan
    "\e[46m#{self}\e[0m"
  end

  def bg_gray
    "\e[47m#{self}\e[0m"
  end

  def bold
    "\e[1m#{self}\e[22m"
  end

  def italic
    "\e[3m#{self}\e[23m"
  end

  def underline
    "\e[4m#{self}\e[24m"
  end

  def blink
    "\e[5m#{self}\e[25m"
  end

  def reverse_color
    "\e[7m#{self}\e[27m"
  end
end

id = 0
events = [
  { id: (id = id.next),
    start_date: "2021-11-15T00:00:00-05:00",
    title: "Ruby Basics 1",
    end_date: "",
    notes: "Ruby Basics 1 notes",
    guests: %w[Teddy Codeka],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2021-11-15T12:00:00-05:00",
    title: "English Course",
    end_date: "2021-11-15T13:30:00-05:00",
    notes: "English notes",
    guests: ["Stephanie"],
    calendar: "english" },
  { id: (id = id.next),
    start_date: "2021-11-16T00:00:00-05:00",
    title: "Ruby Basics 2",
    end_date: "",
    notes: "Ruby Basics 2 notes",
    guests: %w[Andre Codeka],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2021-11-16T12:45:00-05:00",
    title: "Soft Skills - Mindsets",
    end_date: "2021-11-15T13:30:00-05:00",
    notes: "Some extra notes",
    guests: ["Diego"],
    calendar: "soft-skills" },
  { id: (id = id.next),
    start_date: "2021-11-17T00:00:00-05:00",
    title: "Ruby Methods",
    end_date: "",
    notes: "Ruby Methods notes",
    guests: %w[Diego Andre Teddy Codeka],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2021-11-17T12:00:00-05:00",
    title: "English Course",
    end_date: "2021-11-15T13:30:00-05:00",
    notes: "English notes",
    guests: ["Stephanie"],
    calendar: "english" },
  { id: (id = id.next),
    start_date: "2021-11-18T09:00:00-05:00",
    title: "Summary Workshop",
    end_date: "2021-11-19T13:30:00-05:00",
    notes: "A lot of notes",
    guests: %w[Diego Teddy Andre Codeka],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2021-11-18T09:00:00-05:00",
    title: "Extended Project",
    end_date: "",
    notes: "",
    guests: [],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2021-11-19T09:00:00-05:00",
    title: "Extended Project",
    end_date: "",
    notes: "",
    guests: [],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2021-11-19T12:00:00-05:00",
    title: "English for Engineers",
    end_date: "2021-11-19T13:30:00-05:00",
    notes: "English notes",
    guests: ["Stephanie"],
    calendar: "english" },
  { id: (id = id.next),
    start_date: "2021-11-20T10:00:00-05:00",
    title: "Breakfast with my family",
    end_date: "2021-11-20T11:00:00-05:00",
    notes: "",
    guests: [],
    calendar: "default" },
  { id: (id = id.next),
    start_date: "2021-11-20T15:00:00-05:00",
    title: "Study",
    end_date: "2021-11-20T20:00:00-05:00",
    notes: "",
    guests: [],
    calendar: "default" },
  { id: (id = id.next),
    start_date: "2021-11-25T09:00:00-05:00",
    title: "Extended Project",
    end_date: "",
    notes: "",
    guests: [],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2021-11-26T09:00:00-05:00",
    title: "Extended Project",
    end_date: "",
    notes: "",
    guests: [],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2022-02-14T09:00:00-05:00",
    title: "Extended Project",
    end_date: "2022-02-14T12:00:00-05:00",
    notes: "",
    guests: [],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2022-02-14T09:30:00-05:00",
    title: "Extended Project rare",
    end_date: "",
    notes: "",
    guests: [],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2022-02-19T09:00:00-05:00",
    title: "Extended Project rare second part",
    end_date: "2022-02-19T13:30:00-05:00",
    notes: "",
    guests: [],
    calendar: "web-dev" }
]
id.class # for pass rubocop because yet no use id

########################### Methods
@printed_day = false
@printed_day_nbsp = false

# footer prompt event method
def footer_prompt
  puts "-----------------------------------------------------------------"
  k = 0
  arr_k = %w[list create show update delete next prev]
  while k < 7
    print " #{arr_k[k]} ".black.bg_cyan
    print "|"
    k += 1
  end
  print " exit ".bg_red.bold
  puts "\n"
end

# --------------list methods----------------------

def list(events)
  puts "   "
  puts "#{'                     Welcome to CalenCLI                         '.bg_gray.black.italic}   "
  print "   "
  puts "   "
  print "---#{'Date'.cyan}----------#{'Hour'.cyan}-------------#{'Event (Id)'.cyan}"
  print "----------------------"
  puts ""
  monday = Date.today - (Date.today.wday - 1)
  content_list(monday, events)
  puts ""
end

# content of the list element
def content_list(monday, events)
  previous_calendar(Date.parse(monday.to_s), events)
  previous_calendar(Date.parse((monday + 1).to_s), events)
  previous_calendar(Date.parse((monday + 2).to_s), events)
  previous_calendar(Date.parse((monday + 3).to_s), events)
  previous_calendar(Date.parse((monday + 4).to_s), events)
  previous_calendar(Date.parse((monday + 5).to_s), events)
  previous_calendar(Date.parse((monday + 6).to_s), events)
end

# calculate if hash contain the day gave
def previous_calendar(day, events)
  number_date_m = Date.today.wday - 1
  monday = Date.today - number_date_m
  mon_parsed = Date.parse(monday.to_s)
  tues_parsed = Date.parse((monday + 1).to_s)
  wed_parsed = Date.parse((monday + 2).to_s)
  thur_parsed = Date.parse((monday + 3).to_s)
  fri_parsed = Date.parse((monday + 4).to_s)
  sat_parsed = Date.parse((monday + 5).to_s)
  sun_parsed = Date.parse((monday + 6).to_s)
  switch_calendar(day, events, mon_parsed, tues_parsed, wed_parsed, thur_parsed, fri_parsed, sat_parsed, sun_parsed)
end

# check all days of the week monday - saturday
def switch_calendar(day, events, *days)
  case day
  when days[0]
    iterate_hash(days[0], events)
  when days[1]
    iterate_hash(days[1], events)
  when days[2]
    iterate_hash(days[2], events)
  when days[3]
    iterate_hash(days[3], events)
  when days[4]
    iterate_hash(days[4], events)
  when days[5]
    iterate_hash(days[5], events)
  when days[6]
    iterate_hash(days[6], events)
  end
end

# iterate whole hash searching events with a day gave
def iterate_hash(day, events)
  counter = 0
  events.each do |element|
    start_date_h = element[:start_date].to_s
    date = Date.parse(start_date_h).strftime("%a %b %d")
    hora_inicio = Time.parse(start_date_h).strftime("%H:%M")
    if hora_inicio == "00:00" && start_date_h == ""
      hora_inicio = " " * 11
      # hora_fin = " "
    elsif element[:end_date].to_s == ""
      hora_fin = " " * 7
    # elsif hora_inicio == "00:00"
    #  hora_inicio = " " * 11
    else
      hora_fin = "- #{Time.parse(element[:end_date].to_s).strftime('%H:%M')}"
    end
    day_parse = Date.parse(day.to_s).strftime("%a %b %d")
    start_date_p = Date.parse(element[:start_date]).strftime("%a %b %d")
    long = events.length
    text = "#{element[:title]} (#{element[:id]})".green
    # print_elements(day_parse, start_date_p, date, hora_inicio, hora_fin, element[:title], element[:id], counter, long)
    print_elements(day_parse, start_date_p, date, hora_inicio, hora_fin, text, counter, long)
    counter += 1
  end
end

# return hours day_parse 0, start_date_parse 1, date 2, start_hour 3, end_hour 4, title 5, id 6, counter 7, long 8
def print_elements(*parameters)
  day_start = (parameters[0] == parameters[1])
  all_elements_hash = (parameters[6] + 1 == parameters[7])
  if day_start && !@printed_day
    @printed_day = true
    puts "#{parameters[2]}  #{parameters[3]} #{parameters[4]} #{parameters[5]}"
  elsif day_start && @printed_day
    puts "            #{parameters[3]} #{parameters[4]} #{parameters[5]}"
    @printed_day_nbsp = true
  else
    final_hash(all_elements_hash, parameters[0])
  end
end

def final_hash(all_elements_hash, day)
  if all_elements_hash && @printed_day && @printed_day_nbsp == false
    puts ""
    puts "#{day}                No events"
    @printed_day = false
    @printed_day_nbsp = false
  elsif all_elements_hash && @printed_day
    @printed_day = false
    @printed_day_nbsp = false
    puts ""
  elsif all_elements_hash
    @printed_day = false
    @printed_day_nbsp = false
    puts "#{day}                No events"
    puts ""
  end
end

# --------------list methods end---------------------

# --------------create methods----------------------

# method ask if date value are input in YYYY-MM-DD format
def if_valid_date(value, create_action_value, iii)
  y, m, d = value.split "-"
  valid_date = Date.valid_date? y.to_i, m.to_i, d.to_i
  if valid_date == true
    # if is ok push in array
    create_action_value.push(value)
  else
    # else ask again
    puts "Type a valid date: YYYY-MM-DD ".red.bg_gray
    # p defined? iteration -= 1
    iii.push(-1)
  end
end

# method ask if hour value are input in HH:MM < HH:MM format
def if_valid_hour(value, create_action_value, iii)
  inicial, final = value.split
  valid_i = inicial =~ /^([01]?[0-9]|2[0-3]):[0-5][0-9]$/
  valid_f = final =~ /^([01]?[0-9]|2[0-3]):[0-5][0-9]$/
  if (!valid_i.nil? && !valid_f.nil? && inicial < final) || value.empty?
    create_action_value.push(value)
  else
    puts "Format: 'HH:MM HH:MM' or leave it empty".red.bg_gray
    puts "Remember second hour must be greater than first hour".black.bg_brown
    iii.push(-1)
  end
end

# method push event to events hash
def add_event(events, the, id)
  y, m, d = the[0].split "-"
  empty_v = the[3].empty?
  the[3] = "00:00 00:00" if empty_v == true
  inicial, final = the[3].split
  hi, mi = inicial.split ":"
  hf, mf = final.split ":"
  start_date = DateTime.new(y.to_i, m.to_i, d.to_i, hi.to_i, mi.to_i, "00".to_i, "-05:00").strftime("%FT%T%:z")
  start_date2 = DateTime.new(y.to_i, m.to_i, d.to_i, "00".to_i, "00".to_i, "00".to_i, "-05:00").strftime("%FT%T%:z")
  end_date = DateTime.new(y.to_i, m.to_i, d.to_i, hf.to_i, mf.to_i, "00".to_i, "-05:00").strftime("%FT%T%:z")
  d = the[5].split(", ")
  new_event = if empty_v == true
                { id: id, start_date: start_date2, title: the[1], end_date: "", notes: the[4], guests: d }
              else
                { id: id, start_date: start_date, title: the[1], end_date: end_date, notes: the[4], guests: d }
              end
  events.push(new_event)
end

# method create a validation for data input in create
def create_validation(value, iteration, create_action_data, create_action_value, iii)
  # p value
  case create_action_data[iteration]
  # When loop is in date data prompt
  when "date"
    # start valid date verification method
    if_valid_date(value, create_action_value, iii)

  # When loop is in date title prompt
  when "title"
    # if title value is blank ask again
    if value == ""
      puts "Cannot be blank".red.bg_gray
      iii.push(-1)
    # iteration
    # if is ok push in array
    else
      create_action_value.push(value)
    end

  # When loop is in date start_end prompt
  when "start_end"
    if_valid_hour(value, create_action_value, iii) ##########
  else
    create_action_value.push(value)
  end
end

# --------------create methods end----------------------

# --------------show methods----------------------

def show_event(events, value)
  event = events.find { |p| p[:id] == value }
  if event.nil?
    puts "sorry, the event you are looking for does not exist"
  else
    date = Date.parse(event[:start_date]).strftime("%Y-%m-%d")
    if !event[:start_date].empty? && !event[:end_date].empty?
      hora_inicio = Time.parse(event[:start_date]).strftime("%H:%M")
      hora_final = Time.parse(event[:end_date]).strftime("%H:%M")
    else
      hora_inicio = "  "
      hora_final = "  "
    end
    puts "date: #{date}"
    puts "title: #{event[:title]}"
    puts "calendar: #{event[:calendar]}"
    puts "start_end: #{hora_inicio} #{hora_final}"
    puts "notes: #{event[:notes]}"
    puts "guests: #{event[:guests].join(', ')}"
  end
end

# --------------show methods end----------------------

# --------------update methods----------------------

def update_event(events, update_value)
  event = events.find { |p| p[:id] == update_value }
  if event.nil?
    puts "sorry, the event you are looking for does not exist"
  else
    create_action_data = %w[date title calendar start_end notes guests]
    create_action_value = []
    iii = []
    # requiere data - values
    i = 0
    while i < 6
      print "#{create_action_data[i]}: "
      value = gets.chomp
      create_validation(value, i, create_action_data, create_action_value, iii)
      i = i + 1 + iii[0].to_i
      iii = []

    end
    id = update_value
    change_event(events, create_action_value, id, update_value, event)
  end
end

def change_event(events, the, id, replace_id, event)
  y, m, d = the[0].split "-"
  empty_v = the[3].empty?
  the[3] = "00:00 00:00" if empty_v == true
  inicial, final = the[3].split
  hi, mi = inicial.split ":"
  hf, mf = final.split ":"
  start_date = DateTime.new(y.to_i, m.to_i, d.to_i, hi.to_i, mi.to_i, "00".to_i, "-05:00").strftime("%FT%T%:z")
  start_date2 = DateTime.new(y.to_i, m.to_i, d.to_i, "00".to_i, "00".to_i, "00".to_i, "-05:00").strftime("%FT%T%:z")
  end_date = DateTime.new(y.to_i, m.to_i, d.to_i, hf.to_i, mf.to_i, "00".to_i, "-05:00").strftime("%FT%T%:z")
  d = the[5].split(", ")
  replace_event = if empty_v == true
                    { id: id, start_date: start_date2, title: the[1], end_date: "", notes: the[4], guests: d }
                  else
                    { id: id, start_date: start_date, title: the[1], end_date: end_date, notes: the[4], guests: d }
                  end
  event.replace(replace_event)
  puts "    "
  puts "Changes applied successfully!!!".green
  puts "++++++++++++++++++++++++++".green + "-----".red
  puts "    "
  show_event(events, replace_id)
end
# --------------update methods end----------------------

# --------------delete methods----------------------

def delete_event(events, event_id)
  events.delete_if { |event| event[:id] == event_id }
  list(events)
end

# --------------delete methods end--------------------

# Main Program###########################################################################################

list(events)
footer_prompt
action = nil
while action != "exit"
  print "action: "
  action = gets.chomp.strip
  case action
  when "list"
    list(events)
  when "create"
    create_action_data = %w[date title calendar start_end notes guests]
    create_action_value = []
    iii = []
    # requiere data - values
    i = 0
    while i < 6
      print "#{create_action_data[i]}: ".green
      value = gets.chomp
      create_validation(value, i, create_action_data, create_action_value, iii)
      i = i + 1 + iii[0].to_i
      iii = []

    end
    id = id.next
    add_event(events, create_action_value, id)
  when "show"
    print "Event ID: "
    show_value = gets.chomp.to_i

    show_event(events, show_value)

  when "update"
    print "Event ID: "
    update_value = gets.chomp.to_i
    update_event(events, update_value)

  when "delete"
    print "Event ID: ".red
    value_d = gets.chomp.to_i
    delete_event(events, value_d)
    puts "-----------------".red + "   |event #{value_d} was deleted".gray

  when "next"
    puts "inicio accion next"

  when "prev"
    puts "inicio accion prev"

  when "exit"
    puts "Thanks for using calenCLI".cyan
    puts "from : DDC"

  else
    puts "invalid action".red.bg_gray
  end
  footer_prompt  # call method
end
