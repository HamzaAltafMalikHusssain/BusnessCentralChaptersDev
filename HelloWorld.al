// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.ALProject1;

using Microsoft.Sales.Customer;

// this Alcode snippet I am going to checkin  and the commit is second
// Change commited by Hamza Altaf


// Pushing change from Dev Hamza on Dev Hamza (The code has reached on Dev Branch)

pageextension 50104 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}