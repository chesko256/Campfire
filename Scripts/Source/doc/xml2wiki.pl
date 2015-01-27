#!/usr/bin/perl
# DocBook XML to MediaWiki Converter V. 0.0.2
# Many bugs fixed thanks to Ewout feedback
# (C) 2005 Stefano Selleri [GNU GPL License, look for it]
# Designed for migrating Blender DOC from DocBook to Mediawiki
# Use at your Own RISK!
$IMGPATH = shift ;
sub getXML {
  my $a = shift;
  my @b = `ls $a/*.xml 2>1`;
  if (@b==0) { 
    #print "no files\n";
    my @c = `ls $a/* -d 2>1`;
    for my $c (@c) {
      #print $c;
      chomp($c);
      my @d = getXML("$c");
      @b = (@b,@d);
    }
    return @b;
  } else {
    return @b;
    print @b,"++";
  }
}
 
sub getPNG {
  my $a = shift;
  my @b = `ls $a/*.png 2>1`;
  if (@b==0) { 
    #print "no files\n";
    my @c = `ls $a/* -d 2>1`;
    for my $c (@c) {
      #print $c;
      chomp($c);
      my @d = getPNG("$c");
      @b = (@b,@d);
    }
    return @b;
  } else {
    return @b;
    print @b,"++";
  }
}
 
#####################################
@a = `ls Part* -d`;
#@a = `ls PartM -d`;
 
for $a (@a) {
  chomp($a);
  print "+-> Parsing $a\n";
  @b = getXML($a);
  @f = getPNG($a);
 
  #print @f;
 
  for $b (@b) {
    if ($b =~ /\/en\//) {
      print "\n\n",$b;
      chomp($b);
      print "New Location?\n";
      $loc = readline(*STDIN);
      chomp($loc);
      if (length($loc)>0) {
	$img = $loc;
	$img =~ s/\//-/g; 
      }
 
      $b =~ /(.*)\/(.*)\.(.*)/;
      $c = "WIKED/".$img."-$2.wiki";
      print"| +-> Translating $b to $c\n";
      #print "xml2wiki.pl $img <$b >$c";
      $a = `xml2wiki.pl $img <$b >$c`;
      $a = `gatherimg.pl $img <$c`;
 
      open(FH,"<$c");
      $xml = "";
      while (<FH>) {
	if(/\[\[Image:$img-(.*?)\]\]/){
	  $bi = $1;
	  $bi =~ s/(.*?)\|(.*)/$1/;
	  for $f (@f) {
	    chomp($f);
	    if($f =~ /$bi/) { 
	      print $bi,"->", $f;
	      $aa = `cp $f WIKEDIMG/$img-$bi`;
	    }
	  }
 
	}
      }
      close (FH);
 
      #die
 
 
    }	
  }
  print @b;
  print "-------------------------\n";
}