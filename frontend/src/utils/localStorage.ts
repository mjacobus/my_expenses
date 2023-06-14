export default class LocalStorage {
  name: String;
  storage: Storage;

  constructor(name: string = "__default", storage: Storage = localStorage) {
    this.name = name;
    this.storage = storage;
  }

  set(key: string, value: string) {
    this.storage.setItem(`${this.name}:${key}`, value);
  }

  get(key: string, defaultValue: any = null): string | null {
    const value = this.storage.getItem(`${this.name}:${key}`);

    if (value === undefined) {
      return null;
    }

    return value || defaultValue;
  }

  remove(key: string) {
    this.storage.removeItem(`${this.name}:${key}`);
  }

  getInt(key: string, defaultValue: number | null = null): number | null {
    let value: any = this.get(key);

    if (value === null) {
      return defaultValue;
    }

    value = parseInt(value);

    return isNaN(value) ? defaultValue : value;
  }
}

export function create(name: string): LocalStorage {
  return new LocalStorage(name);
}

const defaultStorage = create("__default");

export function get(item: string, defaultValue: any = null): string | null {
  return defaultStorage.get(item, defaultValue);
}

export function set(item: string, value: string) {
  return defaultStorage.set(item, value);
}

export function getInt(item: string, defaultValue: any): number | null {
  return defaultStorage.getInt(item, defaultValue);
}

export function remove(item: string): void {
  return defaultStorage.remove(item);
}
