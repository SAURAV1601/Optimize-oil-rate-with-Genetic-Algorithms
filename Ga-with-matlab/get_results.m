function [qg, ql, qo] = get_results(x, Qt, F)
	% This function to convert the output result from math scale to field scale
	% 
	% PARAMETERS
	% 
	% 	F:			well data
	% 
	% KEYWORD ARGUMENTS
	% 
	% 	x(1:4):		scaled gas injection rate from GA process
	% 	x(5:8):		scaled liquid production rate from GA process
	% 	Qt:			total gas available
	% 
	% RETURNS
	% 
	% 	qg:			injection gas rate field results
	% 	qo:			oil production rate field results

	assert (numel(x) == 8, 'Invalid results from GA process.');
	assert (isstruct(F), 'Invalid input well data.');

	J  = [F.W1.J  F.W2.J  F.W3.J  F.W4.J ];
	Pr = [F.W1.Pr F.W2.Pr F.W3.Pr F.W4.Pr];
    WC = [F.W1.WC F.W2.WC F.W3.WC F.W4.WC];
	qg = x(1:4);
	ql = x(5:8);
    qo = [1 1 1 1];

	% for gas rate
	for i = 1:numel(qg)
		qg(i) = qg(i) * Qt;	
	end
	
	% for liquid rate
    for i = 1:numel(ql)
		ql(i) = ql(i) * J(i) * Pr(i);
    end
    
    % for oil rate
    for i = 1:numel(qo)
        qo(i) = ql(i) * (1 - WC(i));
    end
end

