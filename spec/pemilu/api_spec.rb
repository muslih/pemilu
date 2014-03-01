require "spec_helper"

module Pemilu
  describe API do
    describe "new" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should an object" do
        pemilu.class.should be_a(Object)
      end

    end

    describe "#key" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return 06ec082d057daa3d310b27483cc3962e" do
        expect(pemilu.key).to eq("06ec082d057daa3d310b27483cc3962e")
      end
    end

    describe "#candidates" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return an array" do
        pemilu.candidates.should be_a(Array)
      end

      it "should return an array of Pemilu::Candidate object" do
        pemilu.candidates.each do |candidate|
          expect(candidate.class).to eq(Pemilu::Candidate)
        end
      end
    end

    describe "#candidate" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return one Pemilu::Candidate object" do
        caleg = pemilu.candidate("1101-00-0000-0102")
        expect(caleg.class).to eq(Pemilu::Candidate)
      end

      it "should return details of candidate" do
        caleg = pemilu.candidate("1101-00-0000-0102")
        expect(caleg.id).to eq("1101-00-0000-0102")
        expect(caleg.name).to eq("Drs. H. T. PRIBADI")
        expect(caleg.gender).to eq("L")
        expect(caleg.religion).to eq("ISLAM")
        expect(caleg.birthplace).to eq("BANDA ACEH")
        expect(caleg.date_of_birth).to eq("1950-01-19")
        expect(caleg.marital_status).to eq("KAWIN")
        expect(caleg.name_of_couples).to eq("CUT MUSRI")
        expect(caleg.number_of_children).to eq(3)
        expect(caleg.village).to eq("GEUCEU INIEM")
        expect(caleg.sub_district).to eq("BANDA RAYA")
        expect(caleg.district).to eq("KOTA BANDA ACEH")
        expect(caleg.province.id).to eq(11)
        expect(caleg.province.name).to eq("Aceh")
        expect(caleg.electoral_district.id).to eq("1101-00-0000")
        expect(caleg.electoral_district.name).to eq("Aceh I")
        expect(caleg.election_year).to eq(2014)
        expect(caleg.legislative_body).to eq("DPR")
        expect(caleg.party.id).to eq(1)
        expect(caleg.party.name).to eq("Partai NasDem")
        expect(caleg.ordinal).to eq(2)
        expect(caleg.picture).to eq("http://dct.kpu.go.id/images/foto/DPR/1101.%20ACEH%20I/01.%20NASDEM/02.%20DRS.%20H.T.%20PRIBADI.JPG")
        expect(caleg.educations.class).to eq(Array)
        expect(caleg.jobs.class).to eq(Array)
        expect(caleg.organizations.class).to eq(Array)
      end
    end

  end
end