#!/usr/bin/perl

#$ENV{'PATH'} = "/home/esoh/bioTools/EIG-6.1.4/bin:$ENV{'PATH'}"; 
# MUST put smartpca bin directory in path for smartpca.perl to work


$num_args = $#ARGV + 1;

$base=$ARGV[0];
$k_param=$ARGV[1];
$m_param=$ARGV[2];
$t_param=$ARGV[3];
$s_param=$ARGV[4];
$i_path=$ARGV[5];
$o_path=$ARGV[6];

if ($num_args == 7) {

	print "\nNB: Argument order matters!\n";

	$command = "smartpca.perl";
	$command .= " -i ${i_path}/$base.eigenstratgeno ";
	$command .= " -a ${i_path}/$base.snp ";
	$command .= " -b ${i_path}/$base.ind " ;
	$command .= " -k $k_param ";
	$command .= " -o ${o_path}/$base.pca ";
	$command .= " -p ${o_path}/$base.plot ";
	$command .= " -e ${o_path}/$base.eval ";
	$command .= " -l ${o_path}/$base-pca.log ";
	$command .= " -m $m_param ";
	$command .= " -t $t_param ";
	$command .= " -s $s_param ";
	print("$command\n");
	system("$command");
	
	#$command = "smarteigenstrat.perl "; 
	#$command .= " -i ../CONVERTF/$base.eigenstratgeno ";
	#$command .= " -a ../CONVERTF/$base.snp ";
	#$command .= " -b ../CONVERTF/$base.ind ";
	#$command .= " -p $base.pca ";
	#$command .= " -k $k_param ";
	#$command .= " -o $base.chisq ";
	#$command .= " -l $base-strat.log ";
	#print("$command\n");
	#system("$command");
	#
	#$command = "gc.perl $base.chisq $base.chisq.GC";
	#print("$command\n");
	#system("$command");
	
	#$command = "evec2pca.perl $t_param $base.pca.evec ../CONVERTF/$base.ind $base.pca";
	#print("$command\n");
	#system("$command");
}


else {
        print "\nUsage: ./run_eingenstrat.perl <input_prefix> <k_param> <m_param> <t_param> <s_param> <in_path> <out_path>\n";
        print "\n in_path: Path to EIGENSTRAT formatted files e.g. CONVERTF/world.eigenstratgeno etc";
        print "\nout_path: Path to EIGENSTRAT results e.g. EIGENSTRAT/world.pca etc\n\n";

}

