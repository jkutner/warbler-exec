# warbler-exec

This gem allows you to run commands within the context of a Warbler created WAR file.  It will use the JRuby runtime packaged with the WAR file even when this tool is executed from a different runtime.

## How to Use

This tool provides the `warbler-exec` command that takes this form:

    $ warbler-exec <war-file> <command> <arguments>

But it will only run with the JRuby runtime, so you will need to include everything that's needed in your WAR file.  For example, let's say you want to run Rails migrations from your WAR file.  First, you'll need something like this in your `warble.rb`:

    Warbler::Config.new do |config|      
      config.dirs << "bin"
      config.includes = FileList["Rakefile"]  
      config.bundle_without = [] # bundler will get fussy if we leave out dev and test    
    end

Then run Bundler the with `--binstubs` option, and use `warbler-exec` to run the Rake task:

    $ bundle --binstubs
    $ warble war
    $ gem install warbler-exec
    $ warbler-exec myapp.war bin/rake db:migrate

Every time that `warbler-exec` runs, it extracts the WAR file. Don't expect it to be fast.

# Roadmap

+  It would be a lot easier if we didn't have to run Bundler with the `--binstubs` option.  Eventually, someone (probably the person writing this) will submit a patch to Warbler that gets around this.

+  It would be better if we didn't have to extract the WAR file every time.  That's easy enough to do, but i'm not sure how it would look from the command line.  Would there be a special command to extract the WAR to a particular location? 

