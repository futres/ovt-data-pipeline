**entity.csv:** Specifies the ontology classes for which instances will bemade. Whenever there is a unique value for the property specified by "unique key", a new instance will be created.

**excluded_types.csv:**  Specifies the ontology classes for which instances will NOT be created. You can choose to exlude a class or its ancestors or both. This prevents the creations of a bunch of unneeded instances for root level classes on which no one is likely to query.

**fetch_reasoned.sparql:** SPARQL query for creating output from the pipeline.

**mapping.csv:** Maps column headers of ingested data files to data property IRIs and specify data property domains.

**reasoner.conf:** Used to configure reasoning and building preferences for Ontopilot.

**relations.csv:** Reiterates the relations among the classes specified in entity.csv, based on relations from FOVT.

**rules.csv:** Specifies data processing rules and points to lookup list for traits.

