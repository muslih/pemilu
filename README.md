# pemilu [![Gem Version](https://badge.fury.io/rb/pemilu.png)](http://badge.fury.io/rb/pemilu)
A beautiful Ruby interface of [Pemilu APIs](http://pemiluapi.org)

## Contents
- [Installation][in]
- [How to use pemilu gem][ht]
  - [Configure API key][c]
  - [APIs][a]
    - **Candidate APIs**
      - [List of Candidate attributes][ca]
      - [Get list of all Candidates][g]
      - [#candidates usage example][cux]
      - [Get details of Candidate][gdoc]
      - [#candidate usage example][cue]
    - **Party APIs**  *(not available on current version, wait for the next release)*
      - [List of Party attributes][lop]
      - [Get list of all Parties][gloap]
      - [#parties usage example][psue]
      - [Get details of Party][gdop]
      - [#party(id) usage example][pue] 
    - **Province APIs**  *(not available on current version, wait for the next release)*
      - [List of Province attributes][lopa]
      - [Get list of all Provinces][gloapv]
      - [#provinces usage example][pvue]
      - [Get details of Province][gopv]
      - [#province(id) usage example][pvue]
    - **Electoral District APIs**  *(not available on current version, wait for the next release)*
      - [List of Electoral District attributes][lopa]
      - [Get list of all Electoral Districts][gloapv]
      - [#electoral_districts usage example][pvue]
      - [Get details of Electoral District][gopv]
      - [#electoral_district(id) usage example][pvue]
  - [Exception Handling][eh] *(not available on current version, wait for the next release)*

[in]: https://github.com/pyk/pemilu#installation
[ht]: https://github.com/pyk/pemilu#how-to-use-pemilu-gem
[c]: https://github.com/pyk/pemilu#configure
[a]: https://github.com/pyk/pemilu#apis
[ca]: https://github.com/pyk/pemilu#list-of-candidate-attributes-object
[g]: https://github.com/pyk/pemilu#get-list-of-all-candidates
[cux]: https://github.com/pyk/pemilu#candidate-usage-example
[gdoc]: https://github.com/pyk/pemilu#get-details-of-candidate
[cue]: https://github.com/pyk/pemilu#candidate-usage-example
[si]: https://github.com/pyk/pemilu#still-in-active-development
[lop]: https://github.com/pyk/pemilu#list-of-party-attributes
[gloap]: https://github.com/pyk/pemilu#get-list-of-all-parties
[psue]: https://github.com/pyk/pemilu#parties-usage-example
[gdop]: https://github.com/pyk/pemilu#get-details-of-party
[pue]: https://github.com/pyk/pemilu#partyid-usage-example
[lopa]: https://github.com/pyk/pemilu#list-of-province-attributes
[gloapv]: https://github.com/pyk/pemilu#get-list-of-all-provinces
[pvue]: https://github.com/pyk/pemilu#provinces-usage-example
[gdop]: https://github.com/pyk/pemilu#get-details-of-province
[gopv]: #
[eh]: #

## Installation
Add this line to your application's Gemfile:

```ruby
    gem 'pemilu'
```

And then execute:

```shell
    $ bundle
```

Or install it yourself as:

```shell
    $ gem install pemilu
```

## How to use pemilu gem

### Configure
Before accessing all available [APIs](#contents) make sure Configure your API key first.

``` ruby
    require "pemilu"

    pemilu = Pemilu::API.new(key: "YOUR API KEY")
```

### APIs

#### List of Candidate attributes object
List of available attribute to each candidate that you can get some information
about candidate itself. For example `candidate.id` will display id of candidate.

| Attribute | Return | Description | `#candidates` | `#candidate` |
| --------- | ------ | ----------- | ------------- | ------------ |
| `id` | String | ID of Candidate | x | x |
| `name` | String | Name of Candidate | x | x |
| `gender` | String | Gender of Candidate | x | x |
| `religion`| String | Religion of Candidate | x | x |
| `birthplace` | String | Birthplace of Candidate | x | x |
| `date_of_birth` | String | Date of Candidate birth | x | x |
| `marital_status`| String | Marital status of Candidate | x | x |
| `name_of_couples`| String | Name of Candidate couples | x | x |
| `number_of_children` | Integer | Number of Candidate children | x | x |
| `village` | String | Village where Candidate live | x | x |
| `sub_district` | String | Sub district where Candidate live | x | x |
| `district`| String | District where Candidate live | x | x |
| `province`| Hash | Province where Candidate live | x | x |
| `electoral_district` | Hash | Electoral district where Candidate running on | x | x |
| `election_year`| Integer | Election year where Candidate running on | x | x |
| `legislative_body` | String | Legislative body where Candidate running on (ex. DPR) | x | x |
| `party` | String | Party of Candidate | x | - |
| `party` | Hash | Party of Candidate | - | x |
| `ordinal` | Integer | Ordinal of Candidate | x | x |
| `picture` | String | URL of Candidate picture | x | x |
| `educations` | Array | List of Candidate education history | - | x |
| `jobs` | Array | List of Candidate job history | - | x |
| `organizations` | Array | List of Candidate organization history | - | x |

description:
- `x` mark is sign this attribute available when return from `#candidates` or `#candidate`
- `-` mark is sign this attribute `nil` when return from `#candidates` or `#candidate`

#### Get list of all candidates
Return an array of `Pemilu::Candidate` object that filtered by declared option.

```ruby
    pemilu.candidates(options = {})
```
##### Available options

| Option | Value | Default | Description | Return |
| ------ | ----- | ------- | ----------- | ------ |
| `name` | String | `nil`| String full or partial name of the candidate | Only all candidates that matching with `name` |
| `party` | String | `nil` | Name of the available party | Only all candidates on the `party` |
| `electoral_district` | String | `nil`| ID of electoral district (daerah pilihan) | Only all candidates that running on electoral district |
| `election_year` | Integer | `nil` | Election year (tahun pemilihan)of candidate | Only all candidates that running on election year|
| `province` | String | `nil` | ID of the Province | Only all candidates that running on `province` |
| `gender` | String | `nil` | `"L"` for man and `"W"` for woman|Only all candidates has `gender` specified |
| `religion` | String | `nil` | Religion of the candidate | Only all candidates that have religion specified |
| `legislative_body` | String | `nil` | Legislative body that the candidate is running for | Only all candidates that running on that legislative body |
| `limit` | Integer | `100` | Number of records to return | All candidates on specific limit number |
| `offset` | Integer | `nil` | Number the offset | All candidates from beginning of the offset number |

#### `#candidates` usage example

```ruby
    # get 10 man candidates
    pemilu.candidates(limit: 10, gender: "L")

    # print some information about 2 candidates with Islam religion
    candidates = pemilu.candidates(limit:2, religion: "ISLAM")
    candidates.each do |candidate|
      puts "Name: #{candidate.name}"
      puts "Regligion: #{candidate.religion}"
    end
```

#### Get details of Candidate
Return an object of `Pemilu::Candidate` with an `id` specified.

```ruby
    pemilu.candidate("ID CANDIDATE")
```

ID Candidate must be String. like this `"1101-00-0000-0102"`

#### `#candidate` usage example

```ruby
    # print some information about Candidate with id=1101-00-0000-0102
    candidate = pemilu.candidate("1101-00-0000-0102")
    puts "Name: #{candidate.name}"
```

#### List of Party attributes object
List of available attribute to each Party that you can use for get some information
about party itself. For example `party.id` will display id of party.

| Attribute | Return | Decription | `#parties` | `#party` |
| --------- | ------ | ---------- | ---------- | -------- |
| `id` | Integer | ID of Party | x | x |
| `nick_name` | String | Nick name or abbreviation of Party | x | x |
| `full_name` | String | Full name of Party | x | x |
| `url` | String | URL to Party homepage | x | x |
| `facebook` | String | URL to Party facebook page | x | X |
| `twitter` | String | URL to Party twitter page | x | X |

description:
- `x` mark is sign this attribute available when return from `#parties` or
  `#party`
- `-` mark is sign this attribute `nil` when return from `#parties` or `#party`

#### Get list of all Parties
Return an array of `Pemilu::Party` object.

```ruby
    # get all parties
    pemilu.parties
    #=> [#<Pemilu::Party:0xb833bfcc....]
```

#### `#parties` usage example

```ruby
    # print name and facebook url each for each party
    pemilu.parties.each do |party|
      puts "Party name: #{party.full_name}"
      puts "Party facebook: #{party.facebook}"
    end
```

#### Get details of Party
Return one object of Pemilu::Party specified by ID.

```ruby
    pemilu.party("ID PARTY")
```

`ID PARTY` must be an Integer.

#### `#party(id)` usage example

```ruby
    # print information about Partai Demokrasi Indonesia Perjuangan
    pdip = pemilu.party(4)

    puts pdip.id #=> 4
    puts pdip.nick_name #=> PDI-P
    puts pdip.full_name #=> Partai Demokrasi Indonesia Perjuangan
    puts pdip.facebook #=> https://www.facebook.com/DPP.PDI.Perjuangan
    puts pdip.twitter #=> https://twitter.com/pdi_perjuangan
```

#### List of Province attributes object
List of available attribute to each Province that you can use for get some information
about province itself. For example `province.id` will display id of province.

| Attribute | Return | Decription | `#provinces` | `#province` |
| --------- | ------ | ---------- | ---------- | -------- |
| `id` | Integer | ID of Province | x | x |
| `name` | String | Nick Name of Province | x | x |
| `full_name` | String | Full Name of Province | x | x |
| `international_name` | String | International Name (English) of Province | x | x |
| `available_chairs` | Integer | Availalble chairs for Candidates | x | x |
| `population` | Integer | Population of Province | x | x |
| `electoral_district` | Array | List of Electoral District on Province | - | x |

description:
- `x` mark is sign this attribute available when return from `#provinces` or
  `#province`
- `-` mark is sign this attribute `nil` when return from `#provinces` or `#province`

#### Get list of all Provinces
Return an array of `Pemilu::Province` object.

```ruby
    # get all provinces
    pemilu.provinces
    #=> [#<Pemilu::Province:0xb8c4ceb8....]
```

#### `#provinces` usage example

```ruby
    # print id and international name of each province
    pemilu.provinces.each do |province|
      puts "ID: #{province.id}"
      puts "Internatioal Name: #{province.international_name}"
    end
```

#### Get details of Province
Return one object of Pemilu::Province specified by ID.

```ruby
    pemilu.province("ID PROVINCE")
```

`ID PROVINCE` must be an Integer.

#### `#province(id)` usage example

```ruby
    # print information about Special Region of Aceh
    aceh = pemilu.province(11)

    puts aceh.id #=> 11
    puts aceh.name #=> Aceh
    puts aceh.international_name #=> Special Region of Aceh
```

## Still in active development

23:32 Saturday, 1 March 2014.
Sorry this gem is still under development. Actually you can use it on production
because this gem is [well tested][wt]. But, you don't get full feature yet.
Please wait for the next release. You can give me a shot at [@peeyek][pyk] on twitter.

[wt]: https://github.com/pyk/pemilu/tree/master/spec
[pyk]: https://twitter.com/peeyek/
