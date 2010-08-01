package Sorter;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = {
        NUMS => [],
    };

    return bless $self, $class;
}

sub set_values {
    my $self = shift;
    @{ $self->{NUMS} } = @_;
}

sub get_values {
    my $self = shift;
    return @{ $self->{NUMS} };
}

sub debug_print {
    my $self = shift;
    foreach my $val (@{ $self->{NUMS} }) {
        print "$val,";
    }
}

sub sort {
    my $self = shift;
    $self->_rec_quick_sort($self->{NUMS}, 0, $#{ $self->{NUMS} });
}

sub _rec_quick_sort {
    my $self = shift;
    my ($arr, $left, $right) = @_;

    if ($right - $left <= 0) {
        return;
    }

    my $pivot = @{ $arr }[$right];
    my $part = $self->_partition($arr, $left, $right, $pivot);
    $self->_rec_quick_sort($arr, $left, $part - 1);
    $self->_rec_quick_sort($arr, $part + 1, $right);
}

sub _partition {
    my $self = shift;
    my ($arr, $left, $right, $pivot) = @_;
    my $lp = $left - 1;
    my $rp = $right;# + 1;

    while (1) {
        while ($lp < $right && @$arr[++$lp] < $pivot) {
            ;
        }
        while ($rp > $left  && @$arr[--$rp] > $pivot) {
            ;
        }

        if ($lp >= $rp) {
            last;
        }
        else {
            @$arr[$rp, $lp] = @$arr[$lp, $rp];
        }
    }
    @$arr[$lp, $right] = @$arr[$right, $lp];
    return $lp;
}

1;
