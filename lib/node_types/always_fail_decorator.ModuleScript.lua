local class         = require(game.ReplicatedStorage.BehaviourTree.middleclass)
local Decorator  	= require(game.ReplicatedStorage.BehaviourTree.node_types.decorator)
local AlwaysFailDecorator = class('AlwaysFailDecorator', Decorator)

function AlwaysFailDecorator:success()
  self.control:fail()
end

function AlwaysFailDecorator:fail()
  self.control:fail()
end

return AlwaysFailDecorator

