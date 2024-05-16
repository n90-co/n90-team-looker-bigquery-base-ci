#  How to Use

The standard layer is made up of hand-written LookML refinements that preserve your column changes when you update the base layer.

The standard layer makes use of refinements. Refinements are similar to extends. Extends make a copy of the extended view file, but refinements make the edits in place. For low-level changes that you’re comfortable applying across your entire project, refinements are a more concise way to add business logic to a view without editing the base file.

Some examples of business logic you should add to the standard layer include:
* Renaming columns to be more human-readable
* Defining primary keys or composite primary keys
* Adding descriptions and labels
* Adding measures

Similar to the base layer above, organize your standard layer folders according to your database structure, and create one .layer.lkml file per raw table. Choosing "Create Generic LookML File" will allow you to create a LookML file with any arbitrary file extension before .lkml. Adding this extension clarifies that the file contains hand-written code and not machine-generated code.
