# How to Use

This folder should only contain machine-generated LookML views referencing source tables. Do not edit them.

#### From https://www.spectacles.dev/post/fix-your-lookml-project-structure:
The base layer is the layer of machine-generated LookML views that makes it simple to respond to upstream data schema changes. This layer doesn't contain any hand-editing or business logic.

With an isolated base layer, adding this column is a single button click: re-run the Create View From Table LookML generator to get the latest changes. For some databases, Create View From Table will even pull in column-level descriptions into the view definition, so you’ll even get updated documentation for free with this approach.
