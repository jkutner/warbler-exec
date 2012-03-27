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

# Wait! I need Ruby installed to run the Ruby in my WAR?

Yes, you'll need a Ruby runtime installed on your machine in order to run this Gem (even though it switches to the Ruby inside your WAR file).  There are a few reasons for this:

+  Gems are nice way to distribute tools (better than "go download this script from ...")

+  Ruby is more portable than Shell scripts (this tool works on Windows).

+  This tool can be run on MRI, and most environments have that already installed (especially if they are using Puppet or Chef for configuration management).

+  Eventually, this tool will support more advanced options; such as exploding the WAR file once and running multiple commands.  Use Ruby for this will be much nicer than the alternatives.

# Roadmap

+  It would be a lot easier if we didn't have to run Bundler with the `--binstubs` option.  Eventually, someone (probably the person writing this) will submit a patch to Warbler that gets around this.

+  It would be better if we didn't have to extract the WAR file every time.  That's easy enough to do, but i'm not sure how it would look from the command line.  Would there be a special command to extract the WAR to a particular location? 

