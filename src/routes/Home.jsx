import { Carousel, Timeline, Heading, CWCReps } from "@components";

export default function Home() {
  // TODO: make more flexible to add/remove/change images
  const carouselImages = ["test_img_1.png", "test_img_2.png", "test_img_3.png", "test_img_4.png"];

  return (
    <>
      <div className="relative overflow-hidden">
        <img className="w-full object-center object-fit -z-10" src="/test_img_4.png" />
        <div className="absolute inset-10 flex flex-col items-center justify-center">
          <Heading className="text-xl md:text-8xl animate-fadeIn text-secondary align-middle z-10">
            Welcome to Collegiate Wushu
          </Heading>
        </div>
      </div>
      

      <div className="py-6 bg-off-white hidden md:block">
        <Carousel imgs={carouselImages} />
      </div>

      <div className="py-8 md:py-[12rem] bg-primary text-secondary">
        <Timeline />
      </div>

      <div className="py-8 md:py-[6rem] bg-off-white">
        <CWCReps />
      </div>
    </>
  );
}
