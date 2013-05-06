desc "lint application javascript"
task :coffeelint do
  files = Coffeelint.lint_dir('.')
  files.each do |name, errors|
    name = name[2..-1]

    good = "\u2713"
    bad = "\u2717"

    if errors.length == 0
      puts "  #{good} \e[1m\e[32m#{name}\e[0m"
    else
      puts "  #{bad} \e[1m\e[31m#{name}\e[0m"
      errors.each do |error|
        puts "     #{bad} #\e[31m#{error["lineNumber"]}\e[0m: #{error["message"]}, #{error["context"]}."
      end
    end
  end
end