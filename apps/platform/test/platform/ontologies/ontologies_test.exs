defmodule Platform.OntologiesTest do
  use Platform.DataCase

  alias Platform.Ontologies

  describe "ontologies" do
    alias Platform.Ontologies.Ontology

    @valid_attrs %{constraint_id: 42, perspective_id: 42, representation_id: 42, subject_id: 42}
    @update_attrs %{constraint_id: 43, perspective_id: 43, representation_id: 43, subject_id: 43}
    @invalid_attrs %{constraint_id: nil, perspective_id: nil, representation_id: nil, subject_id: nil}

    def ontology_fixture(attrs \\ %{}) do
      {:ok, ontology} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ontologies.create_ontology()

      ontology
    end

    test "list_ontologies/0 returns all ontologies" do
      ontology = ontology_fixture()
      assert Ontologies.list_ontologies() == [ontology]
    end

    test "get_ontology!/1 returns the ontology with given id" do
      ontology = ontology_fixture()
      assert Ontologies.get_ontology!(ontology.id) == ontology
    end

    test "create_ontology/1 with valid data creates a ontology" do
      assert {:ok, %Ontology{} = ontology} = Ontologies.create_ontology(@valid_attrs)
      assert ontology.constraint_id == 42
      assert ontology.perspective_id == 42
      assert ontology.representation_id == 42
      assert ontology.subject_id == 42
    end

    test "create_ontology/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ontologies.create_ontology(@invalid_attrs)
    end

    test "update_ontology/2 with valid data updates the ontology" do
      ontology = ontology_fixture()
      assert {:ok, ontology} = Ontologies.update_ontology(ontology, @update_attrs)
      assert %Ontology{} = ontology
      assert ontology.constraint_id == 43
      assert ontology.perspective_id == 43
      assert ontology.representation_id == 43
      assert ontology.subject_id == 43
    end

    test "update_ontology/2 with invalid data returns error changeset" do
      ontology = ontology_fixture()
      assert {:error, %Ecto.Changeset{}} = Ontologies.update_ontology(ontology, @invalid_attrs)
      assert ontology == Ontologies.get_ontology!(ontology.id)
    end

    test "delete_ontology/1 deletes the ontology" do
      ontology = ontology_fixture()
      assert {:ok, %Ontology{}} = Ontologies.delete_ontology(ontology)
      assert_raise Ecto.NoResultsError, fn -> Ontologies.get_ontology!(ontology.id) end
    end

    test "change_ontology/1 returns a ontology changeset" do
      ontology = ontology_fixture()
      assert %Ecto.Changeset{} = Ontologies.change_ontology(ontology)
    end
  end
end
