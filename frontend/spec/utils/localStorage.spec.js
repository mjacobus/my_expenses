import { get, set, create, getInt } from "../../src/utils/localStorage";

describe("LocalStorage", () => {
  describe(".get", () => {
    it("returns null if the key does not exist", () => {
      expect(get("key")).toBe(null);
    });

    it("returns deafult value if the key does not exist", () => {
      expect(get("key", "something-else")).toBe("something-else");
    });

    it("returns the value previsously set", () => {
      set("name", "Marcelo");
      const value = get("name");

      expect(value).toEqual("Marcelo");
    });
  });

  describe("create", () => {
    it("segregates stores", () => {
      const a = create("storage1");
      const b = create("storage2");

      a.set("someName", "Marcelo");

      const values = [a.get("someName"), b.get("someName")];

      expect(values).toEqual(["Marcelo", null]);
    });
  });

  describe("getInt", () => {
    it("returns null if the key does not exist", () => {
      expect(getInt("someNumber")).toBe(null);
    });

    it("returns the default value when not set", () => {
      expect(getInt("someNumber", 10)).toBe(10);
    });

    it("returns the defined value", () => {
      set("theNumber", 10);

      expect(getInt("theNumber")).toBe(10);
    });

    it("returns default when isNaN", () => {
      set("theNumber", "not a number");

      expect(getInt("theNumber", 10)).toBe(10);
    });
  });
});
