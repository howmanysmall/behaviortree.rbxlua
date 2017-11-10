local class         = require(game.ReplicatedStorage.Library.BehaviourTree.middleclass)
local Registry      = require(game.ReplicatedStorage.Library.BehaviourTree.registry)
local Node          = require(game.ReplicatedStorage.Library.BehaviourTree.node_types.node)
local BehaviourTree = class('BehaviourTree', Node)
 
BehaviourTree.Node                    = Node
BehaviourTree.Registry                = Registry
BehaviourTree.Task                    = Node
BehaviourTree.BranchNode              = require(game.ReplicatedStorage.Library.BehaviourTree.node_types.branch_node)
BehaviourTree.Priority                = require(game.ReplicatedStorage.Library.BehaviourTree.node_types.priority)
BehaviourTree.ActivePriority          = require(game.ReplicatedStorage.Library.BehaviourTree.node_types.active_priority)
BehaviourTree.Random                  = require(game.ReplicatedStorage.Library.BehaviourTree.node_types.random)
BehaviourTree.Sequence                = require(game.ReplicatedStorage.Library.BehaviourTree.node_types.sequence)
BehaviourTree.Decorator               = require(game.ReplicatedStorage.Library.BehaviourTree.node_types.decorator)
BehaviourTree.InvertDecorator         = require(game.ReplicatedStorage.Library.BehaviourTree.node_types.invert_decorator)
BehaviourTree.AlwaysFailDecorator     = require(game.ReplicatedStorage.Library.BehaviourTree.node_types.always_fail_decorator)
BehaviourTree.AlwaysSucceedDecorator  = require(game.ReplicatedStorage.Library.BehaviourTree.node_types.always_succeed_decorator)

BehaviourTree.register = Registry.register
BehaviourTree.getNode = Registry.getNode

function BehaviourTree:run(object)
  if self.started then
    Node.running(self) --call running if we have control
  else
    self.started = true
    self.object = object or self.object
    self.rootNode = Registry.getNode(self.tree)
    self.rootNode:setControl(self)
    self.rootNode:start(self.object)
    self.rootNode:call_run(self.object)
  end
end

function BehaviourTree:running()
  Node.running(self)
  self.started = false
end

function BehaviourTree:success()
  self.rootNode:finish(self.object);
  self.started = false
  Node.success(self)
end

function BehaviourTree:fail()
  self.rootNode:finish(self.object);
  self.started = false
  Node.fail(self)
end

return BehaviourTree
