// ----------- ---------- candy_vending_seqNNNNN.sv	candy_vending_seqNNNNN	seqNNNNN_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNNNNN.sv ----------- ---------- 
class candy_vending_seqNNNNN extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNNNNN)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNNNNN_tx;
			seqNNNNN_tx = new ("seqNNNNN_tx");

			seqNNNNN_tx = candy_vending_seq_item::type_id::create("seqNNNNN_tx");
			start_item(seqNNNNN_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNNNNN_tx.coins = {N,N,N,N,N};
			//seqNNNNN_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNNNNN_tx.randomize() with {coin_cnt == 5; cost== 25 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_NNNNN",$sformatf ("no of coins %0d", seqNNNNN_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NNNNN",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNNNNN_tx.coins[4],seqNNNNN_tx.coins[3],seqNNNNN_tx.coins[2],seqNNNNN_tx.coins[1],seqNNNNN_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNNNNN_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


