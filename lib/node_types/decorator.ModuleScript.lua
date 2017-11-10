local class         = require(game.ReplicatedStorage.Library.BehaviourTree.middleclass)
local Registry      = require(game.ReplicatedStorage.Library.BehaviourTree.registry)
local Node          = require(game.ReplicatedStorage.Library.BehaviourTree.node_types.node)
local Decorator = class('Decorator', Node)

function Decorator:initialize(config)
  Node.initialize(self, config)
  self.node = Registry.getNode(self.node)
end

function Decorator:setNode(node)
  self.node = Registry.getNode(node)
end

function Decorator:start(object)
  self.node:start(object)
end

function Decorator:finish(object)
  self.node:finish(object)
end

function Decorator:run(object)
  self.node:setControl(self)
  self.node:call_run(object)
end

return Decorator
