#import "@preview/ieee-vgtc:0.0.4": conference

#show: conference.with(
  // Set review: true to enable review mode (hides authors, shows submission info)
  $if(review)$
  review: $review$,
  $endif$
  $if(submission-id)$
  submission-id: $submission-id$,
  $endif$
  $if(category)$
  category: "$category$",
  $endif$
  $if(narrow-doi)$
  narrow-doi: $narrow-doi$,
  $endif$
  $if(title)$
  title: [$title$],
  $endif$
  $if(abstract)$
  abstract: [$abstract$],
  $endif$
  $if(by-author)$
  authors: (
$for(by-author)$
$if(it.name.literal)$
    ( name: "$it.name.literal$",
      organization: [$for(it.affiliations)$$it.name$$sep$, $endfor$],
      orcid: "$it.orchid$",
      email: "$it.email$" ),
$endif$
$endfor$
    ),
$endif$
  $if(teaser)$
  teaser: (
    $if(teaser.image)$
    image: image("$teaser.image$", alt: "$teaser.image-alt$"),
    $endif$
    $if(teaser.caption)$
    caption: "$teaser.caption$"
    $endif$
  ),
  $endif$
  $if(index-terms)$
  index-terms: ($for(index-terms)$"$it$"$sep$, $endfor$),
  $endif$
  $if(bibliography)$
  bibliography: bibliography("$bibliography$"$if(csl)$, style: "$csl$"$endif$),
  $endif$
)

$body$