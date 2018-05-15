The FUNCTIONAL REPRESENTATION of the model splits the domain model into Object an Messages. Objects are NOUNS and Messages are VERBS:

Objects  | Messages
------------- | -------------
Person  | ?
bike  | working?
docking_station  | release_bike
bike  | ride_bike


This is the DOMAIN MODEL, it's an abstract representation of the Objects within the system:

bike <-- working? --> true/false<br>
docking_station <-- release_bike --> ride_bike