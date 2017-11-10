local class         = require(game.ReplicatedStorage.Library.BehaviourTree.middleclass)
local Registry      = require(game.ReplicatedStorage.Library.BehaviourTree.registry)
local Decorator  	= require(game.ReplicatedStorage.Library.BehaviourTree.node_types.decorator)
local InvertDecorator = class('InvertDecorator', Decorator)

function InvertDecorator:success()
  self.control:fail()
end

function InvertDecorator:fail()
  self.control:success()
end

return InvertDecorator
