module Mongoid
  module Lock
    extend ActiveSupport::Concern

    included do
      require 'state_machine'

      attr_accessor :locked_at

      class_attribute :timeout
      self.timeout = 30

      state_machine :state, :initial => :unlocked do
        before_transition :locked => :locked, :if => :can_relock?, :do => :reset_lock

        after_transition :unlocked => :locked, :do => [:set_locked_at, :set_lock_info]
        after_transition :locked => :unlocked, :do => [:clear_locked_at, :clear_locked_at]

         event :lock do
           transition :unlocked => :locked
           transition :locked => same, :do => :raise_lock_error
         end
     
         event :unlock do
           transition :locked => :unlocked
           transition :unlocked => same # Should there be an error?
         end
        
       end
    end

    def set_locked_at
      self.locked_at = Time.now
    end

    def set_lock_info
    end
    
    def clear_locked_at
      self.locked_at = nil
    end

    def clear_lock_info
    end

    def can_relock?
      return self.locked_at ? ((Time.now - self.locked_at ) > timeout) : true
    end
    
    def reset_lock
      self.state = :unlocked
    end
    
    def raise_lock_error
      raise Mongoid::Lock::IsLockedException("is already locked")
    end
  
    class IsLockedException < Exception
    end
    
  end
end
