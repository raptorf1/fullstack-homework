export type Crop = { value: number; label: string };

export type SeasonalCrop = {
  year: number;
  crop: Crop | null;
};

export type Field = {
  id: number;
  name: string;
  area: number;
  balance: string;
  oldbalance: string;
  crops: Array<SeasonalCrop>;
};
