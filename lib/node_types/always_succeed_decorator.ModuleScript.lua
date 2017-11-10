local class         = require(game.ReplicatedStorage.BehaviourTree.middleclass)
local Decorator  	= require(game.ReplicatedStorage.BehaviourTree.node_types.decorator)
local AlwaysSucceedDecorator = class('AlwaysSucceedDecorator', Decorator)

function AlwaysSucceedDecorator:success()
  self.control:success()
end

function AlwaysSucceedDecorator:fail()
  self.control:success()
end

return AlwaysSucceedDecorator
