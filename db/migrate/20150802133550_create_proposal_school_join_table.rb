class CreateProposalSchoolJoinTable < ActiveRecord::Migration
  def change
    create_join_table :proposals, :schools do |t|
      # t.index [:proposal_id, :school_id]
      # t.index [:school_id, :proposal_id]
    end
  end
end
