# knife-manage

Do you manage several chef servers?  Do you ever get sick of
specifying a path to the knife config file _every_ time you want to use knife?
If you answered yes then this is this plugin for you.

## Requirements
The Ruby in the plugin is 1.8.7 compliant and only uses a single standard lib so
this should work with Chef 10.x and Chef 11.x, though I've only tested in on
11.12.x.  If you find a bug please open an issue.

## Installation
```shell
$: gem install knife-manage
```

or for the fancy kids using the chefdk:

```
$: chef gem install knife-manage
```

or if you wanna get super crazy and build from source:

```shell
$: git clone https://github.com/ryancragun/knife-manage
$: cd knife-manage
$: bundle exec rake build
$: gem install pkg/*gem
```

## Configuration
knife-manage expects that you keep your knife configuration files in a central
repository (~/.chef) with a common naming scheme.  If you have multiple knife
file locations don't sweat it.  We've got ya covered.

The naming scheme that is expected is `knife_ORGNAME.rb` where `ORGNAME` is the
 unique identifier for that knife configuration file.  If you use a dash in the
 name `knife-foo.rb` or nothing `knifebar.rb` it should still work okay.

## Usage
```shell
$: knife configure file $COMMAND [OPTIONS]
```

**list**
all available configuration files in the default directory
```shell
$: knife configure file list
foo
bar
```

**show**
which file is currently being used
```shell
$: knife configure file show
foo
```

**set**
the configuration file you want to use
```shell
$: knife configure file set bar
bar
```

If you want to specify a different directory to look for files use the
`--file-dir` switch:

```shell
$: knife configure file list --file-dir ~/code/project/.chef
project
$: knife configure file set --file-dir ~/code/project/.chef project
project
```

knife-manage uses symlinks to point `~/.chef/knife.rb` to the config file of
your choice.  The first time you use the utility it might complain about the
file not being a symlink.  Don't worry, if you use the `--force` switch it'll
backup the file and create a symlink.

## Contributing

1. Fork it ( https://github.com/ryancragun/knife-manage/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Happy Cheffing
