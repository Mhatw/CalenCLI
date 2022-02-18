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
def footer_prompt
  puts "------------------------------------------------------------------------------"
  puts "list | create | show | update | delete | next | prev | exit"
end

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
    titulo = element["title"]
    puts "#{fecha}  #{hora_inicio} #{hora_fin} #{titulo} (#{element[:id]}) "
    puts ""
  end
  footer_prompt
end
list(events)
# Methods

# Main Program
