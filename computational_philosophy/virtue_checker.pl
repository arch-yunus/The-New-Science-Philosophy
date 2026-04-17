% virtue_checker.pl
% Part of The-New-Science-Philosophy (NSP-Core)
% This script uses Prolog (a logic programming language) to define "Virtue Rules".
% Logic is used to deduce if a system is "Hanif" or "Zulm" (Oppressive).

% --- Base Facts (Axioms) ---
property(surveillance, intrusive).
property(open_source, liberating).
property(planned_obsolescence, destructive).
property(biomimicry, sustainable).
property(centralized_control, oppressive).

% --- Philosophical Rules ---

% A technology is 'destructive' if it has destructive properties or devalues essence.
is_harmful(X) :- property(X, intrusive).
is_harmful(X) :- property(X, destructive).
is_harmful(X) :- property(X, oppressive).

% A technology is 'Hanif' (Nature-aligned) if it's sustainable and not harmful.
is_hanif(X) :- 
    property(X, sustainable), 
    not(is_harmful(X)).

% A technology is 'Virtuous' if it's Hanif and liberating.
is_virtuous(X) :- 
    is_hanif(X), 
    property(X, liberating).

% --- Queries for the User ---

% To test if biomimicry is Hanif:
% ?- is_hanif(biomimicry).

% To find all virtuous technologies:
% ?- is_virtuous(Tech).

% To find why surveillance is harmful:
% ?- is_harmful(surveillance).
