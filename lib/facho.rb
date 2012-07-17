# Tell the main app that this extension exists
$extensions = [] unless defined?($extensions)
$extensions << :facho

module Facho
end

require 'facho/railtie'
