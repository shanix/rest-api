# BEL Framework REST API Apache Buildr Buildfile
# vim: filetype=ruby:ts=2:sw=2 :
#
# Build settings
settings = Buildr.settings.build
# Build options
options = Buildr.options

# Disables testing (i.e., defer to a build server)
# options.test = false

# Convenient tasks
# buildr cp -> buildr clean package
task :cp => [:clean, :package]
# buildr p -> buildr package
task :p  => [:package]
# buildr c -> buildr clean
task :c  => [:clean]

# TEST CONFIGURATION
settings['junit'] = '4.11'

# ENVIRONMENT CONFIGURATION
if ENV['INTEGRATION_TESTS'] == '1'
  INTEGRATION_TESTS = true
else
  INTEGRATION_TESTS = false
end
if ENV['PERFORMANCE_TESTS'] == '1'
  PERFORMANCE_TESTS = true
else
  PERFORMANCE_TESTS = false
end

# project = 'BEL Framework REST API'

repositories.remote << 'http://maven.restlet.org'
repositories.remote << 'http://repo1.maven.org/maven2'
restlet_grp = 'org.restlet.jse'
restlet = restlet_grp + ':org.restlet:jar:2.1.2'
jackson = restlet_grp + ':org.restlet.ext.jackson:jar:2.1.2'
json_ext = restlet_grp + ':org.restlet.ext.json:jar:2.1.2'
restlet_test = restlet_grp + ':org.restlet.test:jar:2.1.2'
json = 'org.json:org.json:jar:2.0'
RESTLET = [restlet, jackson, json_ext, json, restlet_test]

# PRINT CONFIGURATION
print '---', "\n"
print 'Integration tests: ', INTEGRATION_TESTS, "\n"
print 'Performance tests: ', PERFORMANCE_TESTS, "\n"
print '---', "\n"

layout = Layout.new
layout[:source, :main, :java] = 'src'
layout[:source, :test, :java] = 'test'
layout[:source, :main, :resources] = 'resources'
layout[:source, :test, :resources] = 'test'
layout[:target, :main, :classes] = 'bin'

define 'BEL Framework REST API', :layout=>layout do
  project.version = '1.0'
  project.group = 'org.openbel.rest'
  compile.with RESTLET
  run.using :main => 'org.openbel.rest.main'
  package :jar
  default_compile_opts compile
end

# Configures default compilation options (1.7 and all lint checks).
def default_compile_opts(compile)
  compile.options.source = '1.7'
  compile.options.target = '1.7'
  compile.options.lint = 'all'
  compile.options.other = %w{-encoding utf-8}
end

# Configures default project version
def configure(project)
  # Setup project tests
  if not INTEGRATION_TESTS
    project.test.exclude '*IT'
  end
end
