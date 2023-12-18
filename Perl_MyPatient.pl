#!/usr/bin/perl
use strict;
use warnings;
use Time::Piece;

sub calc_age {
    my ($dob, $current_date) = @_;
    my $dob_tp = Time::Piece->strptime($dob, '%m/%d/%Y');
    my $age = $current_date->year - $dob_tp->year;
    return $age;
}

sub gen_pin {
    my $pin = int(rand(10000));
    return $pin;
}

while (1) {
    print "Enter first name (or type 'exit' to finish): ";
    my $first_name = <STDIN>;
    chomp($first_name);

    last if lc($first_name) eq 'exit';

    print "Enter middle name: ";
    my $middle_name = <STDIN>;
    chomp($middle_name);

    print "Enter last name: ";
    my $last_name = <STDIN>;
    chomp($last_name);

    print "Enter insurance provider or none: ";
    my $insurance_provider = <STDIN>;
    chomp($insurance_provider);

    print "Enter ailment: ";
    my $ailment = <STDIN>;
    chomp($ailment);

    print "Enter DOB (mm/dd/yyyy): ";
    my $dob = <STDIN>;
    chomp($dob);

    my $current_date = Time::Piece->localtime;
    my $age = calc_age($dob, $current_date);
    my $pin = gen_pin();

    my @patient = (
        "First Name: $first_name",
        "Middle Name: $middle_name",
        "Last Name: $last_name",
        "Insurance Provider: $insurance_provider",
        "Ailment: $ailment",
        "DOB: $dob",
        "Age: $age",
        "PIN: $pin"
    );

    print "Patient data: ", join(", ", @patient), "\n";
}

print "Program Exiting \n";
