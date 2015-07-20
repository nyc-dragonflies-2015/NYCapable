# Review Notes (Steven)

1.  Main Page
  1.  Pulling from mrwallpaper: if you're going to "borrow" for MVP, please put
  it local, this will help speed up your page load considerably.  On localhost
  the main page takes: 3751m; the image is 800K.
1.  Seeding
  1. Looked great.
  1. Obviously some hard-core programming there.  I
  _might_ think that, for pretty professionalism service, that you could
  extract that to a gem e.g. "mta_seeder".  This would show really well in
  terms of interview.


1.  Migrations / seed
  1.  Take a look at that fixtures/ idea


## Side Conversation

Seeding:

It's not uncommon to find a rake task tht might be built which would go
through and update the records for stations, etc.

* google_transit

## Looking at the app/

* about/index: I would just make this a static file, it'll render faster and
  you don't need Rails-fu here.
* home/index: TODO
  *  Don't keep code in-lined, if possible.....
  * routes/show: remove it if you're not using it, as well as the partial
    it uses
* routes/index: TODO
  * seeing `[0]` seems like a bad thing: what does that mean?


## Big takeaways

1.  The handling of the un-uniform data can be cleaned up....Let's try creating
a class that knows how to read in one of those ugly strings and can have
meaningful methods tht allow us to read those data back.  It's just a first
step, we'll see if we can move beyond it.
2.   The un-DRY functions in JS, we should be able to clean those up,
somehow....needs more attention
3.  I think we need jasmine-rails in here...
