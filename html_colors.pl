#!/usr/bin/perl

use CGI;
my $NUM_COLUMNS = 3;

my %HTML_COLORS = (
    'AliceBlue'            => '#F0F8FF',
    'AntiqueWhite'         => '#FAEBD7',
    'Aqua'                 => '#00FFFF',
    'Aquamarine'           => '#7FFFD4',
    'Azure'                => '#F0FFFF',
    'Beige'                => '#F5F5DC',
    'Bisque'               => '#FFE4C4',
    'Black'                => '#000000',
    'BlanchedAlmond'       => '#FFEBCD',
    'Blue'                 => '#0000FF',
    'BlueViolet'           => '#8A2BE2',
    'Brown'                => '#A52A2A',
    'BurlyWood'            => '#DEB887',
    'CadetBlue'            => '#5F9EA0',
    'Chartreuse'           => '#7FFF00',
    'Chocolate'            => '#D2691E',
    'Coral'                => '#FF7F50',
    'CornflowerBlue'       => '#6495ED',
    'Cornsilk'             => '#FFF8DC',
    'Crimson'              => '#DC143C',
    'Cyan'                 => '#00FFFF',
    'DarkBlue'             => '#00008B',
    'DarkCyan'             => '#008B8B',
    'DarkGoldenRod'        => '#B8860B',
    'DarkGray'             => '#A9A9A9',
    'DarkGreen'            => '#006400',
    'DarkKhaki'            => '#BDB76B',
    'DarkMagenta'          => '#8B008B',
    'DarkOliveGreen'       => '#556B2F',
    'Darkorange'           => '#FF8C00',
    'DarkOrchid'           => '#9932CC',
    'DarkRed'              => '#8B0000',
    'DarkSalmon'           => '#E9967A',
    'DarkSeaGreen'         => '#8FBC8F',
    'DarkSlateBlue'        => '#483D8B',
    'DarkSlateGray'        => '#2F4F4F',
    'DarkTurquoise'        => '#00CED1',
    'DarkViolet'           => '#9400D3',
    'DeepPink'             => '#FF1493',
    'DeepSkyBlue'          => '#00BFFF',
    'DimGray'              => '#696969',
    'DodgerBlue'           => '#1E90FF',
    'Feldspar'             => '#D19275',
    'FireBrick'            => '#B22222',
    'FloralWhite'          => '#FFFAF0',
    'ForestGreen'          => '#228B22',
    'Fuchsia'              => '#FF00FF',
    'Gainsboro'            => '#DCDCDC',
    'GhostWhite'           => '#F8F8FF',
    'Gold'                 => '#FFD700',
    'GoldenRod'            => '#DAA520',
    'Gray'                 => '#808080',
    'Green'                => '#008000',
    'GreenYellow'          => '#ADFF2F',
    'HoneyDew'             => '#F0FFF0',
    'HotPink'              => '#FF69B4',
    'IndianRed'            => '#CD5C5C',
    'Indigo'               => '#4B0082',
    'Ivory'                => '#FFFFF0',
    'Khaki'                => '#F0E68C',
    'Lavender'             => '#E6E6FA',
    'LavenderBlush'        => '#FFF0F5',
    'LawnGreen'            => '#7CFC00',
    'LemonChiffon'         => '#FFFACD',
    'LightBlue'            => '#ADD8E6',
    'LightCoral'           => '#F08080',
    'LightCyan'            => '#E0FFFF',
    'LightGoldenRodYellow' => '#FAFAD2',
    'LightGrey'            => '#D3D3D3',
    'LightGreen'           => '#90EE90',
    'LightPink'            => '#FFB6C1',
    'LightSalmon'          => '#FFA07A',
    'LightSeaGreen'        => '#20B2AA',
    'LightSkyBlue'         => '#87CEFA',
    'LightSlateBlue'       => '#8470FF',
    'LightSlateGray'       => '#778899',
    'LightSteelBlue'       => '#B0C4DE',
    'LightYellow'          => '#FFFFE0',
    'Lime'                 => '#00FF00',
    'LimeGreen'            => '#32CD32',
    'Linen'                => '#FAF0E6',
    'Magenta'              => '#FF00FF',
    'Maroon'               => '#800000',
    'MediumAquaMarine'     => '#66CDAA',
    'MediumBlue'           => '#0000CD',
    'MediumOrchid'         => '#BA55D3',
    'MediumPurple'         => '#9370D8',
    'MediumSeaGreen'       => '#3CB371',
    'MediumSlateBlue'      => '#7B68EE',
    'MediumSpringGreen'    => '#00FA9A',
    'MediumTurquoise'      => '#48D1CC',
    'MediumVioletRed'      => '#C71585',
    'MidnightBlue'         => '#191970',
    'MintCream'            => '#F5FFFA',
    'MistyRose'            => '#FFE4E1',
    'Moccasin'             => '#FFE4B5',
    'NavajoWhite'          => '#FFDEAD',
    'Navy'                 => '#000080',
    'OldLace'              => '#FDF5E6',
    'Olive'                => '#808000',
    'OliveDrab'            => '#6B8E23',
    'Orange'               => '#FFA500',
    'OrangeRed'            => '#FF4500',
    'Orchid'               => '#DA70D6',
    'PaleGoldenRod'        => '#EEE8AA',
    'PaleGreen'            => '#98FB98',
    'PaleTurquoise'        => '#AFEEEE',
    'PaleVioletRed'        => '#D87093',
    'PapayaWhip'           => '#FFEFD5',
    'PeachPuff'            => '#FFDAB9',
    'Peru'                 => '#CD853F',
    'Pink'                 => '#FFC0CB',
    'Plum'                 => '#DDA0DD',
    'PowderBlue'           => '#B0E0E6',
    'Purple'               => '#800080',
    'Red'                  => '#FF0000',
    'RosyBrown'            => '#BC8F8F',
    'RoyalBlue'            => '#4169E1',
    'SaddleBrown'          => '#8B4513',
    'Salmon'               => '#FA8072',
    'SandyBrown'           => '#F4A460',
    'SeaGreen'             => '#2E8B57',
    'SeaShell'             => '#FFF5EE',
    'Sienna'               => '#A0522D',
    'Silver'               => '#C0C0C0',
    'SkyBlue'              => '#87CEEB',
    'SlateBlue'            => '#6A5ACD',
    'SlateGray'            => '#708090',
    'Snow'                 => '#FFFAFA',
    'SpringGreen'          => '#00FF7F',
    'SteelBlue'            => '#4682B4',
    'Tan'                  => '#D2B48C',
    'Teal'                 => '#008080',
    'Thistle'              => '#D8BFD8',
    'Tomato'               => '#FF6347',
    'Turquoise'            => '#40E0D0',
    'Violet'               => '#EE82EE',
    'VioletRed'            => '#D02090',
    'Wheat'                => '#F5DEB3',
    'White'                => '#FFFFFF',
    'WhiteSmoke'           => '#F5F5F5',
    'Yellow'               => '#FFFF00',
    'YellowGreen'          => '#9ACD32',
);

my $q = new CGI;

my $css = <<END_CSS;
div.wrapper {
	clear: right;	
	border: 1px solid silver;
}
div.cell {
    position: inline;
	border: 1px dotted silver;
    width: 20em;
}
div.textblock {
	text-align: left;
    vertical-align: middle;
	font-family: "Courier New", Courier, mono;
	font-size: 10pt;
    position: inline;
    height: .75em;
    margin-left: .25em;
}
div.colorblock {
    margin-right: .25em;
    float: left;
	width:  5em;
    height: .75em;
	border: 1px solid black;
}
END_CSS

my @cells = sort sort_by_tone keys(%HTML_COLORS);

my $max_word_len = int( ( 8 + ( sort { $a <=> $b } map { length($_) } @cells )[-1] ) * .83 );

my @grays  = gray(@cells);
my @reds   = red(@cells);
my @greens = green(@cells);
my @blues  = blue(@cells);

print $q->start_html(
    '-title' => 'HTML colors',
    '-style' => {
            '-code' => $css
          . "\ndiv.textblock {width: ${max_word_len}em;}\n"
          . join( "\n", map { "#$_ {background-color: " . $HTML_COLORS{$_} . ';}' } @cells )
    }
  ),
  "\n";

output( 'All Colors', @cells );
output( 'Grays',      gray(@cells) );
output( 'Reds',       red(@cells) );
output( 'Greens',     green(@cells) );
output( 'Blues',      blue(@cells) );

print $q->end_html, "\n";

sub gray
{
    return ( grep { $HTML_COLORS{$_} =~ /^#(..)\1\1$/ } @_ );
}

sub red
{
    return grep {
        my ( $r, $g, $b ) = map { oct( '0x' . $_ ) } unpack( 'x A2 A2 A2', $HTML_COLORS{$_} );
        $r > $g && $r > $b;
    } @_;
}

sub green
{
    return grep {
        my ( $r, $g, $b ) = map { oct( '0x' . $_ ) } unpack( 'x A2 A2 A2', $HTML_COLORS{$_} );
        $r < $g && $g > $b;
    } @_;
}

sub blue
{
    return grep {
        my ( $r, $g, $b ) = map { oct( '0x' . $_ ) } unpack( 'x A2 A2 A2', $HTML_COLORS{$_} );
        $r < $b && $g < $b;
    } @_;
}

sub sort_by_name { lc($a) cmp lc($b); }

sub sort_by_tone
{

    # get the hex value...
    ( my $a_hex = $HTML_COLORS{$a} ) =~ s/^#//;
    ( my $b_hex = $HTML_COLORS{$b} ) =~ s/^#//;

    # unpack it into the RGB bytes...
    my @a_rgb = map { oct( '0x' . $_ ) } unpack( 'x A2 A2 A2', $HTML_COLORS{$a} );
    my @b_rgb = map { oct( '0x' . $_ ) } unpack( 'x A2 A2 A2', $HTML_COLORS{$b} );

    # average the values to give us a pseudo-tone value...
    my $a_avg = ( $a_rgb[0] + $a_rgb[1] + $a_rgb[2] ) / 3;
    my $b_avg = ( $b_rgb[0] + $b_rgb[1] + $b_rgb[2] ) / 3;

    # return the sort comparison...
    ( $a_avg <=> $b_avg )
      or ( $HTML_COLORS{$b} cmp $HTML_COLORS{$a} )
      or ( $a cmp $b );
}

sub output
{
    @_ or return;

    print '<div class="wrapper">', "\n";
    print '<div style="text-align: center">',           shift, '</div>', "\n";

    foreach (@_)
    {
        print qq{<div class="cell"><div class="colorblock" id="$_">&nbsp;</div><div class="textblock">$_/$HTML_COLORS{$_}</div></div>};
    }

    print "</div>\n";
}
