require "date"
require "time"
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
    calendar: "web-dev" }
]
id.class # for pass rubocop because yet no use id

########################### Methods

# footer prompt event method
def footer_prompt
  puts "------------------------------------------------------------------------------"
  puts "list | create | show | update | delete | next | prev | exit"
end

# list event method
def list(events)
  puts "-----------------------------Welcome to CalenCLI------------------------------"
  puts ""
  events.each do |element|
    fecha = Date.parse(element[:start_date]).strftime("%a %b %d")
    hora_inicio = Time.parse(element[:start_date].to_s).strftime("%H:%M")
    if hora_inicio == "00:00" && element[:start_date].to_s == ""
      hora_inicio = " " * 11
      hora_fin = " "
    elsif element[:start_date].to_s == ""
      hora_fin = " " * 7
    elsif hora_inicio == "00:00"
      hora_inicio = " " * 11
    else
      hora_fin = "- #{Time.parse(element[:start_date].to_s).strftime('%H:%M')}"
    end
    titulo = element[:title]
    puts "#{fecha}  #{hora_inicio} #{hora_fin} #{titulo} (#{element[:id]}) "
    puts ""
  end
  footer_prompt
end

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
    puts "Type a valid date: YYYY-MM-DD"
    # p defined? iteration -= 1
    iii.push(-1)
  end
end

def add_event(events, the, id)
  y, m, d = the[0].split "-"
  p y, m, d
  inicial, final = the[3].split
  p inicial, final
  hi, mi = inicial.split ":"
  hf, mf = final.split ":"
  start_date = DateTime.new(y.to_i, m.to_i, d.to_i, hi.to_i, mi.to_i, "00".to_i, "-05:00").strftime("%FT%T%:z")
  end_date = DateTime.new(y.to_i, m.to_i, d.to_i, hf.to_i, mf.to_i, "00".to_i, "-05:00").strftime("%FT%T%:z")
  new_event = { id: id, start_date: start_date, title: the[1], end_date: end_date, notes: the[4], guests: the[5] }
  events.push(new_event)
  p new_event
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
      puts "Cannot be blank"
      iii.push(-1)
    # iteration
    # if is ok push in array
    else
      p create_action_value.push(value)
    end

  # When loop is in date start_end prompt
  when "start_end"
    puts "requiere"
    p create_action_value.push(value)

  # Time.parse()

  # when loop is in optional create action
  else
    p create_action_value.push(value)
  end
end
# Main Program###########################################################################################

list(events)

action = nil
while action != "exit"
  print "action: "
  action = gets.chomp.strip
  case action
  when "list"
    puts "inicio accion list"

  when "create"
    puts "inicio accion create"
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
    p create_action_value
    id = id.next
    add_event(events, create_action_value, id)
    p events
    # crear metodo para pushear al hash
  when "show"
    puts "inicio accion show"

  when "update"
    puts "inicio accion update"

  when "delete"
    puts "inicio accion delete"

  when "next"
    puts "inicio accion next"

  when "prev"
    puts "inicio accion prev"

  when "exit"
    puts "inicio accion exit"

  else
    puts "invalid action"
  end
  footer_prompt  # call method
end
