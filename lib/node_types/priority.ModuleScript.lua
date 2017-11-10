local class         = require(game.ReplicatedStorage.Library.BehaviourTree.middleclass)
local Registry      = require(game.ReplicatedStorage.Library.BehaviourTree.registry)
local BranchNode  	= require(game.ReplicatedStorage.Library.BehaviourTree.node_types.branch_node)
local Priority = class('Priority', BranchNode)

function Priority:success()
  BranchNode.success(self)
  self.control:success()
end

function Priority:fail()
  BranchNode.fail(self)
  self.actualTask = self.actualTask + 1
  if self.actualTask <= #self.nodes then
    self:_run(self.object)
  else
    self.control:fail()
  end
end

return Priority
