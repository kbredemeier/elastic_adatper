require_relative "./shared_context.rb"

module ElasticAdapter
  describe Index do
    describe "unit specs" do
      include_context "index context"

      describe "#initialize" do
        it "assigns the name" do
          expect(subject.instance_variable_get('@name')).to be name
        end

        it "assigns the settings" do
          expect(subject.instance_variable_get('@settings')).to be settings
        end

        it "assigns the document_type" do
          expect(subject.instance_variable_get('@document_type')).to be document_type
        end

        it "assigns the url" do
          expect(subject.instance_variable_get('@url')).to be url
        end

        it "assigns the log" do
          expect(subject.instance_variable_get('@log')).to be log
        end
      end

      describe "getter" do
        describe "name" do
          it "returns the name" do
            expect(subject.name).to eq name
          end
        end

        describe "settings" do
          it "returns the settings" do
            expect(subject.settings).to eq settings
          end
        end

        describe "document_type" do
          it "returns the document_type" do
            expect(subject.document_type).to eq document_type
          end
        end

        describe "url" do
          it "returns the url" do
            expect(subject.url).to eq url
          end
        end

        describe "log" do
          it "returns the log" do
            expect(subject.log).to eq log
          end
        end

        describe "client" do
          it "returns the client" do
            expect(subject.client).to be_a ::Elasticsearch::Transport::Client
          end
        end
      end
    end
  end
end
