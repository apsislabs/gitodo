require 'optparse'

module Gitodo
  class CommandLineOptions

    def self.parse(args)
      options = OpenStruct.new

      explicit_command = false
      options.command = "add"
      # options.inplace = false
      # options.encoding = "utf8"
      # options.transfer_type = :auto
      # options.verbose = false

      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: gitodo [options]"

        opts.separator ""
        opts.separator "Specific options:"

        # Commands
        opts.on("--done", "Finish one or more todo items!") do
          if explicit_command
            puts "Specified multiple commands"
            exit 1
          end

          options.command = "done"
          explicit_command = true
        end
        # opts.on_tail("--version", "Show version") do
        #   puts ::Version.join('.')
        #   exit
        # end

        opts.on("--list", "List the open todo items!") do
          if explicit_command
            puts "Specified multiple commands"
            exit 1
          end

          options.command = "list"
          explicit_command = true
        end

        opts.on("--check", "Check if there are any open todo items, and fail if there are any") do
          if explicit_command
            puts "Specified multiple commands"
            exit 1
          end

          options.command = "check"
          explicit_command = true
        end

        opts.on("--add", "(Default) Add a new todo item") do
          if explicit_command
            puts "Specified multiple commands"
            exit 1
          end

          options.command = "add"
          explicit_command = true
        end

        # Mandatory argument.
        # opts.on("-r", "--require LIBRARY",
        #         "Require the LIBRARY before executing your script") do |lib|
        #   options.library << lib
        # end
        #
        # # Optional argument; multi-line description.
        # opts.on("-i", "--inplace [EXTENSION]",
        #         "Edit ARGV files in place",
        #         "  (make backup if EXTENSION supplied)") do |ext|
        #   options.inplace = true
        #   options.extension = ext || ''
        #   options.extension.sub!(/\A\.?(?=.)/, ".")  # Ensure extension begins with dot.
        # end
        #
        # # Cast 'delay' argument to a Float.
        # opts.on("--delay N", Float, "Delay N seconds before executing") do |n|
        #   options.delay = n
        # end
        #
        # # Cast 'time' argument to a Time object.
        # opts.on("-t", "--time [TIME]", Time, "Begin execution at given time") do |time|
        #   options.time = time
        # end

        # Cast to octal integer.
        # opts.on("-F", "--irs [OCTAL]", OptionParser::OctalInteger,
        #         "Specify record separator (default \\0)") do |rs|
        #   options.record_separator = rs
        # end
        #
        # # List of arguments.
        # opts.on("--list x,y,z", Array, "Example 'list' of arguments") do |list|
        #   options.list = list
        # end

        # Keyword completion.  We are specifying a specific set of arguments (CODES
        # and CODE_ALIASES - notice the latter is a Hash), and the user may provide
        # the shortest unambiguous text.
        # code_list = (CODE_ALIASES.keys + CODES).join(',')
        # opts.on("--code CODE", CODES, CODE_ALIASES, "Select encoding",
        #         "  (#{code_list})") do |encoding|
        #   options.encoding = encoding
        # end

        # Optional argument with keyword completion.
        # opts.on("--type [TYPE]", [:text, :binary, :auto],
        #         "Select transfer type (text, binary, auto)") do |t|
        #   options.transfer_type = t
        # end

        # Boolean switch.
        # opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        #   options.verbose = v
        # end

        # opts.separator ""
        # opts.separator "Common options:"

        # No argument, shows at tail.  This will print an options summary.
        # Try it and see!
        # opts.on_tail("-h", "--help", "Show this message") do
        #   puts opts
        #   exit
        # end

        # Another typical switch to print the version.
        # opts.on_tail("--version", "Show version") do
        #   puts ::Version.join('.')
        #   exit
        # end
      end

      opt_parser.parse!(args)
      options
    end  # parse()
  end
end
