// ----------- ---------- candy_vending_seqDNNQ.sv	candy_vending_seqDNNQ	seqDNNQ_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqDNNQ.sv ----------- ---------- 
class candy_vending_seqDNNQ extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqDNNQ)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqDNNQ_tx;
			seqDNNQ_tx = new ("seqDNNQ_tx");

			seqDNNQ_tx = candy_vending_seq_item::type_id::create("seqDNNQ_tx");
			start_item(seqDNNQ_tx);


			// randomize the sequence or assign values for respective seq items
			//seqDNNQ_tx.coins = {D,N,N,Q};
			//seqDNNQ_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqDNNQ_tx.randomize() with {coin_cnt == 4; cost== 45 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_DNNQ",$sformatf ("no of coins %0d", seqDNNQ_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_DNNQ",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqDNNQ_tx.coins[4],seqDNNQ_tx.coins[3],seqDNNQ_tx.coins[2],seqDNNQ_tx.coins[1],seqDNNQ_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqDNNQ_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


